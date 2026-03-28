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
  for_each = local.datadog_existing_admins_for_each

  exact_match = true
  filter      = each.value
}
