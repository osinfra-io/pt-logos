# Resources
# https://opentofu.org/docs/language/resources

# Datadog Team Resource
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/resources/team

resource "datadog_team" "this" {
  for_each = local.datadog_teams

  description = each.value.description
  handle      = each.value.handle
  name        = each.value.name
}

# Datadog Team Membership Resource
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/resources/team_membership

resource "datadog_team_membership" "this" {
  for_each = local.datadog_team_memberships

  depends_on = [
    datadog_user.this
  ]

  role    = each.value.role
  team_id = datadog_team.this[each.value.team_id].id

  # User ID lookup: admin users managed in logos workspace, regular users in current workspace
  # In non-logos workspaces, admin users are referenced via data source lookup
  user_id = each.value.user_id_lookup == "admin" ? (
    local.within_logos ? datadog_user.admins[local.normalize_email[each.value.user_email]].id : data.datadog_user.existing_admins[local.normalize_email[each.value.user_email]].id
  ) : datadog_user.this[local.normalize_email[each.value.user_email]].id
}

# Datadog User Resource
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/resources/user

# Datadog User Management - Split resources for lifecycle protection
# Organization admins are conditionally created only in logos-production-main workspace to prevent conflicts
# Note: Resource keys use normalized email addresses (@ -> -at-, . -> -) but actual email values are preserved
# Datadog Organization Admins - Protected from deletion
resource "datadog_user" "admins" {
  for_each = local.within_logos ? local.datadog_admin_users : tomap({})

  depends_on = [
    data.datadog_role.this
  ]

  # Protect organization admins from accidental deletion
  lifecycle {
    ignore_changes = [
      roles
    ] # Prevent accidental role changes

    prevent_destroy = true
  }

  email = each.value
  name  = each.value

  roles = [
    local.datadog_user_roles[each.value]
  ]
}

# Regular Datadog Users - Can be destroyed normally
resource "datadog_user" "this" {
  for_each = local.datadog_regular_users

  depends_on = [
    data.datadog_role.this
  ]

  email = each.value
  name  = each.value

  roles = [
    local.datadog_user_roles[each.value]
  ]
}

# GitHub Actions Organization Permissions Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/actions_organization_permissions
# Organization-level resource managed only in logos-production-main workspace

resource "github_actions_organization_permissions" "this" {
  count = local.within_logos ? 1 : 0

  allowed_actions = "selected"

  allowed_actions_config {
    github_owned_allowed = true

    patterns_allowed = [
      "datadog/*",
      "dependabot/*",
      "docker/*",
      "github/*",
      "google-github-actions/*",
      "open-policy-agent/*",
      "opentofu/*",
      "projectdiscovery/*"
    ]

    verified_allowed = false
  }

  enabled_repositories = "all"
}

# Github Branch Protection Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/branch_protection

resource "github_branch_protection" "this" {
  for_each = local.github_branch_protections

  depends_on = [
    github_repository.this
  ]

  enforce_admins                  = false
  pattern                         = "main"
  repository_id                   = github_repository.this[each.key].name
  require_conversation_resolution = true
  require_signed_commits          = true
  required_linear_history         = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }

  required_status_checks {
    contexts = each.value.required_status_checks_contexts
    strict   = true
  }

  restrict_pushes {
    push_allowances = each.value.push_allowances
  }
}

# GitHub Issue Labels Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/issue_label

resource "github_issue_label" "this" {
  for_each = local.github_repository_labels

  name        = each.value.name
  color       = each.value.color
  description = each.value.description
  repository  = github_repository.this[each.value.repository].name
}

# Github Organization Security Manager Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/organization_security_manager

# resource "github_organization_security_manager" "this" {
#   team_slug = github_team.parents["enabling-security"].slug
# }

# GitHub Organization Settings Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/organization_settings
# Organization-level resource managed only in logos-production-main workspace

resource "github_organization_settings" "this" {
  count = local.within_logos ? 1 : 0

  # If you need to import the organization settings, you can do so with the following command:
  # tofu import github_organization_settings.this <org_id>

  # To get the organization id, you can run the following curl command with a token that has the read:org scope against your existing organization.
  # curl -H "Authorization: token $GITHUB_READ_ORG_TOKEN" https://api.github.com/orgs/osinfra-io

  billing_email                                                = "brett@osinfra.io"
  blog                                                         = "https://osinfra.io"
  company                                                      = "Open Source Infrastructure (as Code)"
  default_repository_permission                                = "read"
  dependabot_alerts_enabled_for_new_repositories               = true
  dependabot_security_updates_enabled_for_new_repositories     = true
  dependency_graph_enabled_for_new_repositories                = true
  description                                                  = "Open Source Infrastructure (as Code)"
  email                                                        = "help@osinfra.io"
  has_organization_projects                                    = true
  has_repository_projects                                      = true
  location                                                     = "United States of America"
  members_can_create_internal_repositories                     = false
  members_can_create_pages                                     = false
  members_can_create_private_pages                             = false
  members_can_create_private_repositories                      = true
  members_can_create_public_pages                              = false
  members_can_create_public_repositories                       = true
  members_can_create_repositories                              = true
  members_can_fork_private_repositories                        = false
  name                                                         = "osinfra.io (Alpha)"
  secret_scanning_enabled_for_new_repositories                 = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
  web_commit_signoff_required                                  = false
}

# GitHub Organization Membership Management - Split resources for lifecycle protection
# Organization owners are protected from deletion to maintain platform access
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/membership

# Regular GitHub Members - Can be destroyed normally
resource "github_membership" "members" {
  for_each = setsubtract(local.all_github_users, toset(local.github_organization_owners))

  role     = "member"
  username = each.value
}

# GitHub Organization Owners - Conditionally created only in logos-production-main workspace, protected from deletion
resource "github_membership" "owners" {
  for_each = local.within_logos ? toset(local.github_organization_owners) : toset([])

  # Protect organization owners from accidental deletion
  lifecycle {
    ignore_changes  = [role] # Prevent accidental demotion
    prevent_destroy = true
  }

  role     = "admin"
  username = each.value
}

# Github Repository Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/repository

resource "github_repository" "this" {
  for_each = local.github_repositories

  allow_auto_merge            = true
  allow_merge_commit          = false
  allow_rebase_merge          = false
  allow_squash_merge          = true
  allow_update_branch         = true
  archive_on_destroy          = true
  delete_branch_on_merge      = true
  description                 = each.value.description
  has_downloads               = false
  has_discussions             = false
  has_issues                  = true
  has_projects                = true
  has_wiki                    = false
  homepage_url                = "https://www.osinfra.io"
  is_template                 = false
  license_template            = "gpl-2.0"
  name                        = each.key
  squash_merge_commit_message = "BLANK"
  squash_merge_commit_title   = "PR_TITLE"
  topics                      = each.value.topics
  visibility                  = "public"
  vulnerability_alerts        = true
}

# GitHub Repository Environment Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/repository_environment

resource "github_repository_environment" "this" {
  for_each = local.github_repository_environments

  depends_on = [
    github_repository.this
  ]

  dynamic "deployment_branch_policy" {
    for_each = each.value.deployment_branch_policy != null ? [each.value.deployment_branch_policy] : []

    content {
      custom_branch_policies = deployment_branch_policy.value.custom_branch_policies
      protected_branches     = deployment_branch_policy.value.protected_branches
    }
  }

  environment = each.value.environment
  repository  = github_repository.this[each.value.repo_key].name

  reviewers {
    teams = [
      for team_name in each.value.reviewing_teams :
      github_team.children[team_name].id
    ]
  }
}

# GitHub Repository File Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/repository_file

resource "github_repository_file" "release" {
  for_each = local.github_repositories

  depends_on = [
    github_repository.this
  ]

  branch         = "main"
  commit_author  = "Open Source Infrastructure as Code Service Account"
  commit_email   = "github-sa@osinfra.io"
  commit_message = "Update .github/release.yml"

  content = file("${path.module}/markdown/release.yml")

  file                = ".github/release.yml"
  overwrite_on_create = true
  repository          = each.key
}

resource "github_repository_file" "security_policy" {
  for_each = local.github_repositories

  depends_on = [
    github_repository.this
  ]

  branch         = "main"
  commit_author  = "Open Source Infrastructure as Code Service Account"
  commit_email   = "github-sa@osinfra.io"
  commit_message = "Update SECURITY.md"

  content = templatefile("${path.module}/markdown/SECURITY.md.tpl", {
    repository = each.key
  })

  file                = "SECURITY.md"
  overwrite_on_create = true
  repository          = each.key
}

# Github Repository Webhook Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/repository_webhook

resource "github_repository_webhook" "datadog" {
  for_each = local.github_repository_datadog_webhooks

  depends_on = [
    github_repository.this
  ]

  active = true

  configuration {
    content_type = "json"
    insecure_ssl = false
    url          = "https://app.datadoghq.com/intake/webhook/github?api_key=${var.github_datadog_webhook_api_key}"
  }

  events = [
    "branch_protection_rule",         # This event occurs when there is activity relating to branch protection rules
    "commit_comment",                 # This event occurs when there is activity relating to commit comments
    "create",                         # This event occurs when a Git branch or tag is created
    "delete",                         # This event occurs when a Git branch or tag is deleted
    "dependabot_alert",               # This event occurs when there is activity relating to Dependabot alerts
    "issue_comment",                  # This event occurs when there is activity relating to a comment on an issue or pull request
    "issues",                         # This event occurs when there is activity relating to an issue
    "public",                         # This event occurs when repository visibility changes from private to public
    "pull_request",                   # This event occurs when there is activity on a pull request
    "pull_request_review_comment",    # This event occurs when there is activity relating to a pull request review comment
    "push",                           # This event occurs when there is a push to a repository branch
    "repository",                     # This event occurs when there is activity relating to repositories
    "repository_vulnerability_alert", # This event occurs when there is activity relating to a security vulnerability alert in a repository
    "team_add"                        # This event occurs when a team is added to a repository
  ]

  repository = each.key
}

resource "github_repository_webhook" "discord" {
  for_each = local.github_repository_discord_webhooks

  depends_on = [
    github_repository.this
  ]

  active = true

  configuration {
    content_type = "json"
    insecure_ssl = false
    url          = "https://discord.com/api/webhooks/1175823442415722517/${var.github_discord_webhook_api_key}/github"
  }

  events = ["*"]

  repository = each.key
}

# GitHub Team Resource - Parent Teams
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/team

# If you need to import a team, you can do so with the following command:
# tofu import github_team.parents\["team-key"\] <team_id>

# To get the team ids, you can run the following curl command with a token that has the read:org scope against your own organization.
# curl -H "Authorization: token $GITHUB_READ_ORG_TOKEN" https://api.github.com/orgs/osinfra-io/teams

resource "github_team" "parents" {
  for_each = local.github_parent_teams

  description = each.value.description
  name        = each.value.name
  privacy     = each.value.privacy
}

# GitHub Team Resource - Child Teams
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/team

resource "github_team" "children" {
  for_each = local.github_child_teams

  description    = each.value.description
  name           = each.value.name
  parent_team_id = github_team.parents[each.value.parent_team].id
  privacy        = each.value.privacy
}

# GitHub Team Membership Resource - Child Teams
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/team_membership

resource "github_team_membership" "child_maintainers" {
  for_each = local.github_child_team_maintainers

  role     = each.value.role
  team_id  = github_team.children[each.value.team_key].id
  username = each.value.username
}

resource "github_team_membership" "child_members" {
  for_each = local.github_child_team_members

  role     = each.value.role
  team_id  = github_team.children[each.value.team_key].id
  username = each.value.username
}

# GitHub Team Membership Resource - Parent Teams
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/team_membership

resource "github_team_membership" "parents" {
  for_each = local.github_parent_team_memberships

  role     = each.value.role
  team_id  = github_team.parents[each.value.team_key].id
  username = each.value.username
}

# Github Team Repository Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/team_repository

resource "github_team_repository" "children" {
  for_each = local.github_team_repository_child_permissions

  depends_on = [
    github_repository.this,
    github_team.children
  ]

  permission = each.value.permission
  repository = github_repository.this[each.value.repository].name
  team_id    = github_team.children[each.value.child_team_key].id
}

resource "github_team_repository" "parents" {
  for_each = local.github_team_repository_parent_permissions

  depends_on = [
    github_repository.this,
    github_team.parents
  ]

  permission = each.value.permission
  repository = github_repository.this[each.value.repository].name
  team_id    = github_team.parents[each.value.team_key].id
}

# GitHub Team Settings Resource
# https://search.opentofu.org/provider/integrations/github/latest/docs/resources/team_settings

resource "github_team_settings" "this" {
  for_each = local.github_review_request_delegations

  review_request_delegation {
    algorithm    = "LOAD_BALANCE"
    member_count = each.value.member_count
    notify       = false
  }

  team_id = github_team.parents[each.key].id
}

# GitHub Organization Projects V2 - Not yet supported in Terraform provider
# GitHub has deprecated classic Projects (v1) in favor of Projects V2 (beta)
# The Terraform GitHub provider doesn't yet have full support for Projects V2
#
# Manual creation steps for now:
# 1. Go to https://github.com/orgs/osinfra-io/projects
# 2. Create new project for each team:
#    - Name: {team.display_name} (e.g., "Logos")
#    - Description: "{display_name} is a {team_type} {description}. This project tracks work, features, and initiatives for the {display_name} team."
# 3. Add team access via project Settings → Manage access
#
# TODO: Implement when Terraform provider supports Projects V2
# Tracking: https://github.com/integrations/terraform-provider-github/issues/1661

# Google Billing Budget Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/google_billing_budget

resource "google_billing_budget" "teams" {
  for_each = var.google_billing_account != null ? var.team : {}

  amount {
    specified_amount {
      currency_code = "USD"
      units         = var.google_monthly_budget_amount
    }
  }

  billing_account = var.google_billing_account

  budget_filter {
    resource_ancestors = [google_folder.team[each.key].id]
  }

  display_name = "${each.value.display_name} Monthly"

  threshold_rules {
    threshold_percent = 0.50
    spend_basis       = "CURRENT_SPEND"
  }

  threshold_rules {
    threshold_percent = 0.75
    spend_basis       = "CURRENT_SPEND"
  }

  threshold_rules {
    threshold_percent = 1.0
    spend_basis       = "CURRENT_SPEND"
  }
}

# Cloud Identity Group Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/cloud_identity_group

resource "google_cloud_identity_group" "this" {
  for_each = local.google_identity_groups

  # When you signed up for Google Workspace or Cloud Identity, your account is assigned a unique customer ID.
  # You can look up this ID in your Admin console.
  # https://admin.google.com/ac/accountsettings/profile

  description  = each.value.description
  display_name = each.value.display_name

  group_key {
    id = "${each.value.email_key}@${var.google_primary_domain}"
  }

  initial_group_config = "EMPTY"

  labels = {
    # Must not contain more than one entry and must contain the following entry:
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }

  parent = "customers/${var.google_customer_id}"
}

# Google Cloud Identity Group for Team Environment Project Creators
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/cloud_identity_group

# Provides centralized access management for service accounts that need to create projects
# Groups are scoped to team + environment for proper isolation (e.g., pt-corpus-sandbox-project-creators)
resource "google_cloud_identity_group" "team_environment_project_creators" {
  for_each = local.team_environment_project_creator_groups

  description  = each.value.description
  display_name = each.value.display_name

  group_key {
    id = "${each.key}@${var.google_primary_domain}"
  }

  initial_group_config = "EMPTY"

  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }

  parent = "customers/${var.google_customer_id}"
}

# Cloud Identity Group Membership Resources
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/cloud_identity_group_membership

resource "google_cloud_identity_group_membership" "managers" {
  # Iterate over local.google_identity_managers to create a resource for each user in the manager list.
  for_each = local.google_identity_managers

  group = google_cloud_identity_group.this[each.value.group].id

  preferred_member_key {
    id = each.value.manager
  }

  # MEMBER role must be specified. The order of roles should not be changed.
  roles { name = "MEMBER" }
  roles { name = "MANAGER" }
}

resource "google_cloud_identity_group_membership" "members" {
  # Iterate over local.google_identity_members to create a resource for each user in the member list.
  for_each = local.google_identity_members

  group = google_cloud_identity_group.this[each.value.group].id

  preferred_member_key {
    id = each.value.member
  }

  roles { name = "MEMBER" }
}

resource "google_cloud_identity_group_membership" "owners" {
  # Iterate over local.google_identity_owners to create a resource for each user in the owner list.
  for_each = local.google_identity_owners

  group = google_cloud_identity_group.this[each.value.group].id

  preferred_member_key {
    id = each.value.owner
  }

  # MEMBER role must be specified. The order of roles should not be changed.
  roles { name = "OWNER" }
  roles { name = "MEMBER" }
}

# Google Folder Resources
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/google_folder

# Folder resources provide grouping mechanism and isolation boundaries between projects.
# This creates a 2-level hierarchy following Team Topologies methodology:
#   Teams (Logos, Pneuma, Ethos, etc.) - created under pre-existing team type folders
#   └── Environments (Sandbox, Non-Production, Production)
#
# Team type folders (Platform Teams, Stream-aligned Teams, etc.) are pre-created and referenced via google_team_type_folder_ids variable.

resource "google_folder" "environment" {
  for_each = local.environments

  deletion_protection = false
  display_name        = each.value.environment
  parent              = google_folder.team[each.value.team].name
}

resource "google_folder" "team" {
  for_each = var.team

  deletion_protection = false
  display_name        = each.value.display_name
  parent              = "folders/${var.google_team_type_folder_ids[each.value.team_type]}"
}

# Google Folder IAM Member Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/google_folder_iam_member

# Assign identity groups to team folders with their specified roles
# Groups inherit access to all child environment folders
resource "google_folder_iam_member" "team_access" {
  for_each = local.google_iam_bindings

  depends_on = [
    google_cloud_identity_group.this,
    google_folder.team
  ]

  folder = google_folder.team[each.value.team_key].name
  member = "group:${google_cloud_identity_group.this[each.value.group_key].group_key[0].id}"
  role   = each.value.role
}

# Grant team environment project creator groups access to their respective environment folders
# Each group has projectCreator role scoped to specific team + environment combination
resource "google_folder_iam_member" "team_environment_project_creators" {
  for_each = local.environments

  depends_on = [
    google_cloud_identity_group.team_environment_project_creators,
    google_folder.environment
  ]

  folder = google_folder.environment[each.key].name
  member = "group:${google_cloud_identity_group.team_environment_project_creators["${each.value.team}-${each.value.environment == "Sandbox" ? "sandbox" : each.value.environment == "Non-Production" ? "non-production" : "production"}"].group_key[0].id}"
  role   = "roles/resourcemanager.projectCreator"
}
