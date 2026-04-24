# Output Values
# https://opentofu.org/docs/language/values/outputs
#
# Foundational infrastructure outputs providing team structure, folder hierarchy,
# and identity groups for downstream consumption by project deployment repositories.
#
# IMPORTANT: Do not expose sensitive values (credentials, keys, tokens) in these outputs.
# All team repositories have access to these outputs via remote state data sources.
# Sensitive values are managed separately with appropriate access controls.

output "teams" {
  description = "Comprehensive team infrastructure with folders, identity groups, and metadata"
  value = {
    for team_key, team in var.teams : team_key => {
      # Billing users group (organization-wide, same for all teams)
      billing_users_group = local.within_logos ? {
        description  = local.google_billing_users_group.description
        display_name = local.google_billing_users_group.display_name
        email        = google_cloud_identity_group.billing_users.group_key[0].id
        name         = google_cloud_identity_group.billing_users.name
      } : null

      # Team metadata
      display_name                     = team.display_name
      enable_datadog_apm               = try(team.platform_managed_project.enable_datadog_apm, false)
      enable_google_project            = team.enable_google_project
      enable_platform_managed_datadog  = try(team.platform_managed_project.enable_datadog, false)
      enable_opentofu_state_management = team.enable_opentofu_state_management
      enable_workflows                 = team.enable_workflows

      # Environment folders
      environments = {
        for env_key, env in local.environments :
        env.environment => google_folder.environments[env_key].id
        if startswith(env_key, "${team_key}-")
      }

      # GitHub Repositories for this team
      github_repositories = {
        for repo_key, repo in local.github_repositories :
        repo_key => {
          enable_google_wif_service_account = repo.enable_google_wif_service_account
          full_name                         = github_repository.this[repo_key].full_name
          html_url                          = github_repository.this[repo_key].html_url
          name                              = github_repository.this[repo_key].name
        }
        if repo.team_key == team_key
      }

      # Platform-managed project config for this team
      has_platform_managed_project = team.platform_managed_project != null
      platform_managed_project = {
        kubernetes_engine_locations = try(team.platform_managed_project.kubernetes_engine.locations, {})
      }

      # Google Cloud project flags for this team (consumed by corpus)
      google_project_enable_datadog = team.google_project_enable_datadog
      google_project_services       = team.google_project_services

      # DNS subdomain for this team (e.g., "pneuma" → pneuma.osinfra.io in prod, pneuma.sb.osinfra.io in sandbox)
      dns_subdomain = try(team.platform_managed_project.kubernetes_engine.dns_subdomain, null)

      # Identity groups for this team
      identity_groups = {
        for group_key, group in local.google_cloud_identity_groups :
        trimsuffix(trimprefix(group_key, "${team_key}-"), "") => {
          description  = group.description
          display_name = group.display_name
          email        = google_cloud_identity_group.this[group_key].group_key[0].id
          name         = google_cloud_identity_group.this[group_key].name
          role         = trimsuffix(trimprefix(group_key, "${team_key}-"), "")
        }
        if startswith(group_key, "${team_key}-")
      }

      # Folder hierarchy
      team_folder_id      = google_folder.teams[team_key].id
      team_type           = team.team_type
      team_type_folder_id = var.google_team_type_folder_ids[team.team_type]
    }
  }
}
