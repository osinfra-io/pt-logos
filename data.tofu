# Data Sources
# https://opentofu.org/docs/language/data-sources

# Datadog Logs Index Order Data Source
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/data-sources/logs_index_order

data "datadog_logs_indexes_order" "this" {}

# Datadog Role Data Sources
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/data-sources/role

# Fetch all required Datadog roles
data "datadog_role" "this" {
  for_each = toset([
    "Datadog Admin Role",
    "Datadog Read Only Role",
    "Datadog Standard Role"
  ])

  filter = each.key
}

# Datadog User Data Sources
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/data-sources/user

# Lookup existing Datadog users by email for cross-workspace references
# Only lookup organization admin users in non-logos workspaces
data "datadog_user" "existing_admins" {
  for_each = local.within_logos ? tomap({}) : {
    for email in local.datadog_organization_admins :
    replace(replace(email, "@", "-at-"), ".", "-") => email
  }

  exact_match = true
  filter      = each.value
}

# GitHub Application Data Source
# https://search.opentofu.org/provider/integrations/github/latest/docs/data-sources/app

# Currently private GitHub Apps can only use this endpoint on themselves and if we use a private GitHub App for authentication, we can't
# use this data source to get the node_id of another GitHub App.
# Only fetch in logos-production-main workspace to avoid conflicts

data "github_app" "pr_approve_and_merge_osinfra_io" {
  lifecycle {
    enabled = local.within_logos
  }

  slug = "pr-approve-and-merge-osinfra-io"
}
