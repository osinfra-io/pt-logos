# Local Values
# https://opentofu.org/docs/language/values/locals
#
# Transforms team structure into flattened maps for resource creation using Team Topologies methodology.
# Email addresses in resource keys are normalized (@ -> -at-, . -> -) for ease of use, readability, and administration.
# All locals are organized alphabetically for easy navigation and maintenance.

locals {
  # Combine team users with Datadog admins and standard users to get complete Datadog user set
  all_datadog_users = toset(concat(
    tolist(local.datadog_users),
    local.datadog_organization_admins,
    local.datadog_organization_standard_users
  ))

  # Combine team users with organization owners to get complete GitHub user set
  all_github_users = toset(concat(
    tolist(local.github_users),
    local.github_organization_owners
  ))

  # Create normalized mappings for Datadog admin users (protected from deletion)
  datadog_admin_users = {
    for email in local.datadog_organization_admins :
    replace(replace(email, "@", "-at-"), ".", "-") => email
  }

  # Hardcoded Datadog organization admins - users who should have admin role
  # WARNING: These users are protected from deletion via lifecycle rules in main.tofu
  # To remove a user: 1) Remove from this list, 2) Run tofu plan/apply, 3) Manually remove via Datadog UI
  datadog_organization_admins = ["brett@osinfra.io"]

  # Hardcoded Datadog standard users - users who should have standard role (vs read-only default)
  datadog_organization_standard_users = []

  # Create normalized mappings for regular Datadog users
  # Admin users are always excluded since they're managed separately (only in logos workspace)
  datadog_regular_users = {
    for email in setsubtract(local.all_datadog_users, toset(local.datadog_organization_admins)) :
    replace(replace(email, "@", "-at-"), ".", "-") => email
  }

  # Flatten Datadog team memberships with role handling
  # Admin users can be team members in any workspace using data source lookups for cross-workspace references
  # Regular users are managed in current workspace only
  datadog_team_memberships = { for membership in flatten([
    for team_key, team in local.datadog_teams : concat(
      [
        for user_email in team.admins : {
          key            = "${team_key}-${replace(replace(user_email, "@", "-at-"), ".", "-")}-admin"
          role           = "admin"
          team_id        = team_key
          user_email     = user_email
          user_id_lookup = contains(local.datadog_organization_admins, user_email) ? "admin" : "regular"
        }
      ],
      [
        for user_email in setsubtract(toset(team.members), toset(team.admins)) : {
          key            = "${team_key}-${replace(replace(user_email, "@", "-at-"), ".", "-")}-member"
          role           = "member"
          team_id        = team_key
          user_email     = user_email
          user_id_lookup = contains(local.datadog_organization_admins, user_email) ? "admin" : "regular"
        }
      ]
    )
  ]) : membership.key => membership }

  # Create Datadog teams for each top-level team with hardcoded definitions and customizable membership
  datadog_teams = {
    for team_key, team in var.team : team_key => {
      name        = "${local.team_type_labels[team.team_type]}: ${team.display_name}"
      description = "${team.display_name} is a ${local.team_type_labels[team.team_type]} ${local.team_topologies_descriptions[team.team_type]}."
      handle      = team_key
      admins      = team.datadog_team_memberships.admins
      members     = team.datadog_team_memberships.members
    }
  }

  # Determine Datadog user role IDs (admin > standard > read-only as default)
  datadog_user_roles = {
    for email in local.all_datadog_users :
    email => contains(local.datadog_organization_admins, email) ? data.datadog_role.this["Datadog Admin Role"].id : (
      contains(local.datadog_organization_standard_users, email) ? data.datadog_role.this["Datadog Standard Role"].id : data.datadog_role.this["Datadog Read Only Role"].id
    )
  }

  # Extract all unique Datadog users from team configurations (excluding organization admins)
  datadog_users = toset(flatten([
    for team_key, team in local.datadog_teams : concat(team.admins, team.members)
  ]))

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

  # Billing users groups - provides centralized management of service accounts that need billing access
  # One group per team for billing account user role access
  billing_users_groups = { for team_key, team in var.team : team_key => {
    description  = "Service accounts authorized to use the billing account for ${team.display_name} projects"
    display_name = "${local.team_type_labels[team.team_type]}: ${team.display_name} Billing Users"
    group_key    = "${team_key}-billing-users"
    team_key     = team_key
  } }

  # Team environment project creator groups - provides centralized access management for service accounts
  # Service accounts need projectCreator role on their respective environment folders to create projects
  team_environment_project_creator_groups = { for group in flatten([
    for team_key, team in var.team : [
      for environment in ["sandbox", "non-production", "production"] : {
        description  = "Service accounts authorized to create projects in ${team.display_name} ${replace(environment, "-", " ")} environment folders"
        display_name = "${local.team_type_labels[team.team_type]}: ${team.display_name} ${title(replace(environment, "-", " "))} Project Creators"
        environment  = environment
        group_key    = "${team_key}-${environment}-project-creators"
        team_key     = team_key
      }
    ]
  ]) : group.group_key => group }

  # Create branch protection configurations for repositories
  github_branch_protections = { for repo in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : {
        key                             = repo_key
        required_status_checks_contexts = []
        push_allowances                 = repo.push_allowances
      }
    ]
  ]) : repo.key => repo }

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
      for github_team_key in ["sandbox-approvers", "non-production-approvers", "production-approvers", "repository-administrators"] : {
        description = "${title(replace(github_team_key, "-", " "))}${endswith(github_team_key, "-approvers") ? " team for GitHub Actions" : ""}."
        key         = "${team_key}-${github_team_key}"
        maintainers = team.github_child_teams_memberships[github_team_key].maintainers
        members     = team.github_child_teams_memberships[github_team_key].members
        name        = "${team_key}-${github_team_key}"
        parent_team = team_key
        privacy     = "closed"
      }
    ]
  ]) : github_team.key => github_team }



  # Hardcoded GitHub organization owners - users who should have admin/owner role
  # WARNING: These users are protected from deletion via lifecycle rules in main.tofu
  # To remove a user: 1) Remove from this list, 2) Run tofu plan/apply, 3) Manually remove via GitHub UI
  github_organization_owners = ["brettcurtis"]

  # Flatten GitHub parent team memberships (configured members/maintainers plus child team maintainers)
  github_parent_team_memberships = { for item in flatten([
    for team_key, team in var.team : concat(
      # Configured parent team maintainers
      [
        for username in team.github_parent_team_memberships.maintainers :
        { team_key = team_key, username = username, role = "maintainer" }
      ],
      # Configured parent team members
      [
        for username in team.github_parent_team_memberships.members :
        { team_key = team_key, username = username, role = "member" }
      ],
      # Auto-add child team maintainers as members (deduplicated)
      [
        for username in distinct(flatten([
          for github_team_key, github_team in team.github_child_teams_memberships : github_team.maintainers
        ])) : { team_key = team_key, username = username, role = "member" }
        if !contains(concat(team.github_parent_team_memberships.maintainers, team.github_parent_team_memberships.members), username)
      ]
    )
  ]) : "${item.team_key}-${item.username}" => item }

  # Create parent GitHub teams for each team
  github_parent_teams = {
    for team_key, team in var.team : team_key => {
      name        = team_key
      description = "${team.display_name} is a ${local.team_type_labels[team.team_type]} ${local.team_topologies_descriptions[team.team_type]}."
      privacy     = "closed"
    }
  }

  # Flatten GitHub repositories from team configurations
  github_repositories = { for repo in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : {
        description            = repo.description
        enable_datadog_webhook = repo.enable_datadog_webhook
        enable_discord_webhook = repo.enable_discord_webhook
        key                    = repo_key
        push_allowances        = repo.push_allowances
        team_key               = team_key
        topics                 = distinct(concat(repo.topics, ["osinfra", team.team_type, team_key]))
      }
    ]
  ]) : repo.key => repo }

  # Review request delegations for GitHub teams with sufficient members
  # Requires 3+ total members since PR author can't review their own code
  github_review_request_delegations = {
    for team_key, team in var.team : team_key => {
      team_key      = team_key
      total_members = length(concat(team.github_parent_team_memberships.maintainers, team.github_parent_team_memberships.members))
      # Request (total_members - 1) reviewers, max 2, to account for PR author
      member_count = min(max(length(concat(team.github_parent_team_memberships.maintainers, team.github_parent_team_memberships.members)) - 1, 1), 2)
    }
    if length(concat(team.github_parent_team_memberships.maintainers, team.github_parent_team_memberships.members)) >= 3
  }

  # Filter GitHub repositories that have Datadog webhooks enabled
  github_repository_datadog_webhooks = { for repo in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : {
        key                    = repo_key
        enable_datadog_webhook = repo.enable_datadog_webhook
      }
      if repo.enable_datadog_webhook
    ]
  ]) : repo.key => repo }

  # Filter GitHub repositories that have Discord webhooks enabled
  github_repository_discord_webhooks = { for repo in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : {
        key                    = repo_key
        enable_discord_webhook = repo.enable_discord_webhook
      }
      if repo.enable_discord_webhook
    ]
  ]) : repo.key => repo }

  # Flatten GitHub repository environments for each repository that has environments configured
  github_repository_environments = { for env in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : [
        for env_key, environment in repo.environments : {
          key                      = "${repo_key}-${env_key}"
          repo_key                 = repo_key
          environment              = environment.name
          reviewing_teams          = environment.reviewers.teams
          deployment_branch_policy = environment.deployment_branch_policy
        }
      ]
    ]
  ]) : env.key => env }

  # Default GitHub repository labels with consistent colors and descriptions
  github_repository_default_labels = {
    "bug"              = { color = "84A255", description = "Something is not working" }
    "chore"            = { color = "FBCA04", description = "Grunt tasks etc; no production code change" }
    "documentation"    = { color = "0075CA", description = "Improvements or additions to documentation" }
    "enhancement"      = { color = "A2EEEF", description = "New feature or request" }
    "good first issue" = { color = "7057FF", description = "Good for newcomers" }
    "major"            = { color = "B60205", description = "Major version: Incompatible changes" }
    "minor"            = { color = "FBCA04", description = "Minor version: Additional functionality in a backwards-compatible manner" }
    "patch"            = { color = "0E8A16", description = "Patch version: Backwards-compatible bug fixes" }
    "security"         = { color = "B60205", description = "Security vulnerability or configuration" }
    "tech-debt"        = { color = "443221", description = "Accrued work that is owed to a system or process" }
  }

  # Flatten repository labels by applying default labels to all repositories
  github_repository_labels = {
    for label in flatten([
      for team_key, team in var.team : [
        for repo_key, repo in team.github_repositories : [
          for label_key, label in local.github_repository_default_labels : {
            name        = label_key
            color       = label.color
            description = label.description
            repository  = repo_key
          }
        ]
      ]
  ]) : "${label.repository}-${label.name}" => label }

  # Flatten GitHub team repository permissions - repository administrators get admin access
  github_team_repository_child_permissions = { for permission in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : {
        key            = "${repo_key}-repository-administrators"
        repository     = repo_key
        team_key       = team_key
        child_team_key = "${team_key}-repository-administrators"
        permission     = "admin"
      }
    ]
  ]) : permission.key => permission }

  # Flatten GitHub team repository permissions for parent teams - write access only
  github_team_repository_parent_permissions = { for permission in flatten([
    for team_key, team in var.team : [
      for repo_key, repo in team.github_repositories : {
        key        = "${repo_key}-parent"
        repository = repo_key
        team_key   = team_key
        permission = "push"
      }
    ]
  ]) : permission.key => permission }

  # Extract all unique GitHub users from team configurations (excluding organization owners)
  github_users = toset(flatten([
    for team_key, team in var.team : concat(
      team.github_parent_team_memberships.maintainers,
      team.github_parent_team_memberships.members,
      flatten([for child_team in values(team.github_child_teams_memberships) : concat(child_team.maintainers, child_team.members)])
    )
  ]))

  # Google Cloud role descriptions mapping
  google_role_descriptions = {
    "reader" = "Permissions for read-only actions that don't affect state, such as viewing (but not modifying) existing resources or data."
    "writer" = "All of the permissions in the Reader role, plus permissions for actions that modify state, such as changing existing resources."
    "admin"  = "All of the permissions in the Writer role, plus permissions for actions like the following: Completing sensitive tasks, like managing tag bindings for Compute Engine resources; Managing roles and permissions for a project and all resources within the project; Setting up billing for a project."
  }

  # Google Cloud role display names mapping (plural forms for group names)
  google_role_display_names = {
    "admin"  = "Administrators"
    "reader" = "Readers"
    "writer" = "Writers"
  }

  # Google Cloud role email suffixes mapping (plural forms for email addresses)
  google_role_email_suffixes = {
    "admin"  = "administrators"
    "reader" = "readers"
    "writer" = "writers"
  }

  # Flatten IAM role bindings for team folder assignments (top-level team folders only)
  # Groups get access to entire team folder and all child environments
  google_iam_bindings = { for binding in flatten([
    for identity_group_key, group in local.google_identity_groups : [
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
  google_identity_groups = { for identity_group in flatten([
    for team_key, team in var.team : [
      for group_key in ["admin", "writer", "reader"] : {
        description  = local.google_role_descriptions[group_key]
        display_name = "${local.team_type_labels[team.team_type]}: ${team.display_name} ${local.google_role_display_names[group_key]}"
        email_key    = "${team_key}-${local.google_role_email_suffixes[group_key]}"
        key          = "${team_key}-${group_key}"
        managers     = team.google_identity_groups_memberships[group_key].managers
        members      = team.google_identity_groups_memberships[group_key].members
        owners       = team.google_identity_groups_memberships[group_key].owners
        roles        = ["roles/${group_key}"]
        team         = team_key
      }
    ]
  ]) : identity_group.key => identity_group }

  # Flatten Google identity group manager memberships
  google_identity_managers = { for item in flatten([
    for group_key, group in local.google_identity_groups : [
      for user in group.managers : { group = group_key, user = user }
    ]
  ]) : "${item.group}-${replace(replace(item.user, "@", "-at-"), ".", "-")}" => { group = item.group, manager = item.user } }

  # Flatten Google identity group member memberships
  google_identity_members = { for item in flatten([
    for group_key, group in local.google_identity_groups : [
      for user in group.members : { group = group_key, user = user }
    ]
  ]) : "${item.group}-${replace(replace(item.user, "@", "-at-"), ".", "-")}" => { group = item.group, member = item.user } }

  # Flatten Google identity group owner memberships
  google_identity_owners = { for item in flatten([
    for group_key, group in local.google_identity_groups : [
      for user in group.owners : { group = group_key, user = user }
    ]
  ]) : "${item.group}-${replace(replace(item.user, "@", "-at-"), ".", "-")}" => { group = item.group, owner = item.user } }

  # Helper function to normalize email addresses for resource keys
  normalize_email = {
    for email in local.all_datadog_users :
    email => replace(replace(email, "@", "-at-"), ".", "-")
  }

  # Map team type keys to plural display names for reference
  # Used for team type folder names (e.g., "Platform Teams", "Stream-aligned Teams") - folders are pre-created
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

  # Team Topologies descriptions mapping
  team_topologies_descriptions = {
    "stream-aligned-team"        = "aligned to a flow of work from (usually) a segment of the business domain"
    "platform-team"              = "providing a compelling internal product to accelerate delivery by Stream-aligned teams"
    "complicated-subsystem-team" = "where significant mathematics/calculation/technical expertise is needed"
    "enabling-team"              = "helps Stream-aligned teams to overcome obstacles. Also detects missing capabilities"
  }

  # If we are within Logos workspace, create admin/owner resources (prevents conflicts across team deployments)
  within_logos = terraform.workspace == "pt-logos-main-production"
}
