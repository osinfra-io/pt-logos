# Datadog Role Data Sources
# https://search.opentofu.org/provider/DataDog/datadog/latest/docs/data-sources/role

# Fetch all required Datadog roles
data "datadog_role" "this" {
  for_each = local.is_production_environment ? toset([
    "Datadog Admin Role",
    "Datadog Read Only Role",
    "Datadog Standard Role"
  ]) : toset([])

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

# Google Folder Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/google_folder

data "google_folder" "environment" {
  for_each = local.google_existing_environment_folders

  folder = each.value
}

# Google Organization Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/google_organization

data "google_organization" "this" {
  for_each = local.google_organization_lookup

  domain = var.google_primary_domain
}

data "terraform_remote_state" "logos_root" {
  for_each = local.environment != null && !local.within_environment_logos ? toset(["root"]) : toset([])

  backend = "gcs"

  config = {
    bucket = "pt-logos-state-${local.environment_short}"
    prefix = "pt-logos"
  }

  workspace = "pt-logos-main-${coalesce(local.environment, "invalid")}"
}
