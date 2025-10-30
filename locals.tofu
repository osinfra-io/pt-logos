# Local Values
# https://opentofu.org/docs/language/values/locals
#
# Transforms team structure into flattened maps for resource creation using Team Topologies methodology.
# Email addresses in resource keys are normalized (@ -> -at-, . -> -) for ease of use, readability, and administration.
# All locals are organized alphabetically for easy navigation and maintenance.

locals {

  # Flatten Datadog team memberships with role handling and deduplication
  datadog_team_memberships = { for membership in flatten([
    for team_key, team in local.datadog_teams : concat(
      [
        for user_email in team.admins : {
          key     = "${team_key}-${replace(replace(user_email, "@", "-at-"), ".", "-")}-admin"
          team_id = team_key
          user_id = user_email
          role    = "admin"
        }
      ],
      [
        for user_email in setsubtract(toset(team.members), toset(team.admins)) : {
          key     = "${team_key}-${replace(replace(user_email, "@", "-at-"), ".", "-")}-member"
          team_id = team_key
          user_id = user_email
          role    = "member"
        }
      ]
    )
  ]) : membership.key => membership }

  # Create Datadog teams for each top-level team with hardcoded definitions and customizable membership
  datadog_teams = {
    for team_key, team in var.team : team_key => {
      name        = "${local.team_type_labels[team.team_type]}: ${team.display_name}"
      description = "${team.display_name} is a ${local.team_type_labels[team.team_type]} ${local.team_topologies_descriptions[team.team_type]}."
      handle      = "${local.team_type_short_names[team.team_type]}-${team_key}"
      admins      = team.datadog_team.admins
      members     = team.datadog_team.members
    }
  }

  # Extract all unique Datadog users from team configurations (excluding organization admins)
  datadog_users = toset(flatten([
    for team_key, team in local.datadog_teams : concat(team.admins, team.members)
  ]))

  # Filter repositories that have Datadog webhooks enabled
  datadog_webhooks = { for repository in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.repositories : {
        key                    = repo_key
        enable_datadog_webhook = repo.enable_datadog_webhook
      }
      if repo.enable_datadog_webhook
    ]
  ]) : repository.key => repository }

  # Filter repositories that have Discord webhooks enabled
  discord_webhooks = { for repository in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.repositories : {
        key                    = repo_key
        enable_discord_webhook = repo.enable_discord_webhook
      }
      if repo.enable_discord_webhook
    ]
  ]) : repository.key => repository }

  # Create branch protection configurations for repositories
  github_branch_protections = { for repository in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.repositories : {
        key                             = repo_key
        required_status_checks_contexts = []
        push_allowances                 = repo.push_allowances
      }
    ]
  ]) : repository.key => repository }

  # Extract all unique GitHub users from team configurations (excluding organization owners)
  github_users = toset(flatten([
    for team_key, team in var.team : concat(
      team.github_parent_team.maintainers,
      team.github_parent_team.members,
      flatten([for child_team in values(team.github_child_teams) : concat(child_team.maintainers, child_team.members)])
    )
  ]))

  # Hardcoded GitHub organization owners - users who should have admin/owner role
  # WARNING: These users are protected from deletion via lifecycle rules in main.tofu
  # To remove a user: 1) Remove from this list, 2) Run tofu plan/apply, 3) Manually remove via GitHub UI
  github_organization_owners = ["brettcurtis"]

  # Hardcoded Datadog organization admins - users who should have admin role
  # WARNING: These users are protected from deletion via lifecycle rules in main.tofu
  # To remove a user: 1) Remove from this list, 2) Run tofu plan/apply, 3) Manually remove via Datadog UI
  datadog_organization_admins = ["brett@osinfra.io"]

  # Hardcoded Datadog standard users - users who should have standard role (vs read-only default)
  datadog_organization_standard_users = []

  # Combine team users with organization owners to get complete GitHub user set
  all_github_users = toset(concat(
    tolist(local.github_users),
    local.github_organization_owners
  ))

  # Combine team users with Datadog admins and standard users to get complete Datadog user set
  all_datadog_users = toset(concat(
    tolist(local.datadog_users),
    local.datadog_organization_admins,
    local.datadog_organization_standard_users
  ))

  # Create normalized mappings for Datadog admin users (protected from deletion)
  datadog_admin_users = {
    for email in local.datadog_organization_admins :
    replace(replace(email, "@", "-at-"), ".", "-") => email
  }

  # Create normalized mappings for regular Datadog users
  datadog_regular_users = {
    for email in setsubtract(local.all_datadog_users, toset(local.datadog_organization_admins)) :
    replace(replace(email, "@", "-at-"), ".", "-") => email
  }

  # Helper function to normalize email addresses for resource keys
  normalize_email = {
    for email in local.all_datadog_users :
    email => replace(replace(email, "@", "-at-"), ".", "-")
  }

  # Helper function to extract user names from email addresses
  datadog_user_names = {
    for email in local.all_datadog_users :
    email => split("@", email)[0]
  }

  # Determine user roles (admin for org owners, member for others)
  github_user_roles = {
    for username in local.all_github_users :
    username => contains(local.github_organization_owners, username) ? "admin" : "member"
  }

  # Determine Datadog user role IDs (admin > standard > read-only as default)
  datadog_user_roles = {
    for email in local.all_datadog_users :
    email => contains(local.datadog_organization_admins, email) ? data.datadog_role.this["Datadog Admin Role"].id : (
      contains(local.datadog_organization_standard_users, email) ? data.datadog_role.this["Datadog Standard Role"].id : data.datadog_role.this["Datadog Read Only Role"].id
    )
  }

  # Flatten all environments from all teams into a single map
  # Creates keys like "logos-sandbox" for each team-environment combination
  # Structure: team_types → teams → hardcoded environments
  environments = { for environment in flatten([
    for team_key, team in var.team : [
      for environment in ["Sandbox", "Non-Production", "Production"] : {
        team        = team_key
        environment = environment
      }
    ]
  ]) : "${environment.team}-${lower(environment.environment)}" => environment }

  # Flatten GitHub child team maintainer memberships
  github_child_team_maintainers = { for item in flatten([
    for team_key, team in local.github_child_teams : [
      for username in team.maintainers : { team_key = team_key, username = username, role = "maintainer" }
    ]
  ]) : "${item.team_key}-${item.username}" => item }

  # Flatten GitHub child team member memberships
  github_child_team_members = { for item in flatten([
    for team_key, team in local.github_child_teams : [
      for username in team.members : { team_key = team_key, username = username, role = "member" }
    ]
  ]) : "${item.team_key}-${item.username}" => item }

  # Flatten GitHub child teams with hardcoded definitions and customizable memberships
  # Team descriptions are generated dynamically from the team key with "team for GitHub Actions" suffix for approvers
  github_child_teams = { for github_team in flatten([
    for team_key, team in var.team : [
      for github_team_key in ["sandbox-approver", "non-production-approver", "production-approver", "repository-administrators"] : {
        key         = "${local.team_type_short_names[team.team_type]}-${team_key}-${github_team_key}"
        parent_team = team_key
        name        = "${local.team_type_short_names[team.team_type]}-${team_key}-${github_team_key}"
        description = "${title(replace(github_team_key, "-", " "))}${endswith(github_team_key, "-approver") ? " team for GitHub Actions" : ""}."
        privacy     = "closed"
        maintainers = team.github_child_teams[github_team_key].maintainers
        members     = team.github_child_teams[github_team_key].members
      }
    ]
  ]) : github_team.key => github_team }

  # Flatten GitHub parent team memberships (configured members/maintainers plus child team maintainers)
  github_parent_team_memberships = { for item in flatten([
    for team_key, team in var.team : concat(
      # Configured parent team maintainers
      [
        for username in team.github_parent_team.maintainers :
        { team_key = team_key, username = username, role = "maintainer" }
      ],
      # Configured parent team members
      [
        for username in team.github_parent_team.members :
        { team_key = team_key, username = username, role = "member" }
      ],
      # Auto-add child team maintainers as members (deduplicated)
      [
        for username in distinct(flatten([
          for github_team_key, github_team in team.github_child_teams : github_team.maintainers
        ])) : { team_key = team_key, username = username, role = "member" }
        if !contains(concat(team.github_parent_team.maintainers, team.github_parent_team.members), username)
      ]
    )
  ]) : "${item.team_key}-${item.username}" => item }

  # Create parent GitHub teams for each team
  github_parent_teams = {
    for team_key, team in var.team : team_key => {
      name        = "${local.team_type_short_names[team.team_type]}-${team_key}"
      description = "${team.display_name} is a ${local.team_type_labels[team.team_type]} ${local.team_topologies_descriptions[team.team_type]}."
      privacy     = "closed"
    }
  }

  # Flatten GitHub repositories from team configurations
  github_repositories = { for repository in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.repositories : {
        key                    = repo_key
        team_key               = team_key
        description            = repo.description
        topics                 = repo.topics
        push_allowances        = repo.push_allowances
        enable_discord_webhook = repo.enable_discord_webhook
        enable_datadog_webhook = repo.enable_datadog_webhook
      }
    ]
  ]) : repository.key => repository }

  # Flatten GitHub team repository permissions - repository administrators get admin access
  github_team_repository_child_permissions = { for permission in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.repositories : {
        key            = "${repo_key}-repository-administrators"
        repository     = repo_key
        team_key       = team_key
        child_team_key = "${local.team_type_short_names[team.team_type]}-${team_key}-repository-administrators"
        permission     = "admin"
      }
    ]
  ]) : permission.key => permission }

  # Flatten GitHub team repository permissions for parent teams - write access only
  github_team_repository_parent_permissions = { for permission in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.repositories : {
        key        = "${repo_key}-parent"
        repository = repo_key
        team_key   = team_key
        permission = "push"
      }
    ]
  ]) : permission.key => permission }

  # Review request delegations for GitHub teams with sufficient members
  # Requires 3+ total members since PR author can't review their own code
  review_request_delegations = {
    for team_key, team in var.team : team_key => {
      team_key      = team_key
      total_members = length(concat(team.github_parent_team.maintainers, team.github_parent_team.members))
      # Request (total_members - 1) reviewers, max 2, to account for PR author
      member_count = min(max(length(concat(team.github_parent_team.maintainers, team.github_parent_team.members)) - 1, 1), 2)
    }
    if length(concat(team.github_parent_team.maintainers, team.github_parent_team.members)) >= 3
  }

  # Google Cloud role descriptions mapping
  google_role_descriptions = {
    "reader" = "Permissions for read-only actions that don't affect state, such as viewing (but not modifying) existing resources or data."
    "writer" = "All of the permissions in the Reader role, plus permissions for actions that modify state, such as changing existing resources."
    "admin"  = "All of the permissions in the Writer role, plus permissions for actions like the following: Completing sensitive tasks, like managing tag bindings for Compute Engine resources; Managing roles and permissions for a project and all resources within the project; Setting up billing for a project."
  }

  # Flatten IAM role bindings for team folder assignments (top-level team folders only)
  # Groups get access to entire team folder and all child environments
  iam_bindings = { for binding in flatten([
    for identity_group_key, group in local.identity_groups : [
      for role in group.roles : {
        binding_key = "${identity_group_key}-${replace(role, "/", "-")}"
        group_key   = identity_group_key
        team_key    = group.team
        role        = role
      }
    ]
  ]) : binding.binding_key => binding }

  # Flatten Google identity groups with hardcoded definitions and customizable membership
  # Creates exactly 3 groups per team: admin, writer, reader
  # Uses official Google Cloud role descriptions
  identity_groups = { for identity_group in flatten([
    for team_key, team in var.team : [
      for group_key in ["admin", "writer", "reader"] : {
        key          = "${team_key}-${group_key}"
        team         = team_key
        description  = local.google_role_descriptions[group_key]
        display_name = "${local.team_type_labels[team.team_type]}: ${team.display_name} ${title(group_key)}"
        managers     = team.google_identity_groups[group_key].managers
        members      = team.google_identity_groups[group_key].members
        owners       = team.google_identity_groups[group_key].owners
        roles        = ["roles/${group_key}"]
      }
    ]
  ]) : identity_group.key => identity_group }

  # Flatten identity group manager memberships
  managers = { for item in flatten([
    for group_key, group in local.identity_groups : [
      for user in group.managers : { group = group_key, user = user }
    ]
  ]) : "${item.group}-${replace(replace(item.user, "@", "-at-"), ".", "-")}" => { group = item.group, manager = item.user } }

  # Flatten identity group member memberships
  members = { for item in flatten([
    for group_key, group in local.identity_groups : [
      for user in group.members : { group = group_key, user = user }
    ]
  ]) : "${item.group}-${replace(replace(item.user, "@", "-at-"), ".", "-")}" => { group = item.group, member = item.user } }

  # Flatten identity group owner memberships
  owners = { for item in flatten([
    for group_key, group in local.identity_groups : [
      for user in group.owners : { group = group_key, user = user }
    ]
  ]) : "${item.group}-${replace(replace(item.user, "@", "-at-"), ".", "-")}" => { group = item.group, owner = item.user } }

  # Map team type keys to plural display names for folder creation
  # Used for team type folders (e.g., "Platform Teams", "Stream-aligned Teams")
  team_type_display_names = {
    "stream-aligned-team"        = "Stream-aligned Teams"
    "platform-team"              = "Platform Teams"
    "complicated-subsystem-team" = "Complicated-subsystem Teams"
    "enabling-team"              = "Enabling Teams"
  }

  # Helper: team type singular labels (removes "s" from display names)
  # Used throughout for consistent description formatting (e.g., "Platform Team" instead of "Platform Teams")
  team_type_labels = {
    for key, display_name in local.team_type_display_names :
    key => trimsuffix(display_name, "s")
  }

  # Map team type keys to short abbreviations for compact identifiers
  team_type_short_names = {
    "stream-aligned-team"        = "st"
    "platform-team"              = "pt"
    "complicated-subsystem-team" = "cst"
    "enabling-team"              = "et"
  }

  # Team Topologies descriptions mapping
  team_topologies_descriptions = {
    "stream-aligned-team"        = "aligned to a flow of work from (usually) a segment of the business domain"
    "platform-team"              = "providing a compelling internal product to accelerate delivery by Stream-aligned teams"
    "complicated-subsystem-team" = "where significant mathematics/calculation/technical expertise is needed"
    "enabling-team"              = "helps  Stream-aligned teams to overcome obstacles. Also detects missing capabilities"
  }

  # Extract unique team types from all teams to create team type folders
  # Results in a set like: ["platform-team", "stream-aligned-team"]
  team_types = toset([
    for team_key, team in var.team : team.team_type
  ])

  # If we are within Logos, create the foundational order
  # within_logos = terraform.workspace == "pt-logos"
  # Use while testing locally this will be removed in the future
  within_logos = terraform.workspace == "default"
}
