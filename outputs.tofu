# Output Values
# https://opentofu.org/docs/language/values/outputs
#
# Foundational infrastructure outputs providing team structure, folder hierarchy,
# and identity groups for downstream consumption by project deployment repositories.

# Complete team infrastructure information
output "teams" {
  description = "Comprehensive team infrastructure with folders, identity groups, and metadata"
  value = {
    for team_key, team in var.team : team_key => {
      # Team metadata
      display_name = team.display_name

      # Environment folders
      environments = {
        for env_key, env in local.environments :
        env.environment => google_folder.environment[env_key].id
        if startswith(env_key, "${team_key}-")
      }

      # Billing users group (organization-wide, same for all teams)
      billing_users_group = local.within_logos ? {
        description  = local.billing_users_group.description
        display_name = local.billing_users_group.display_name
        email        = google_cloud_identity_group.billing_users[0].group_key[0].id
        name         = google_cloud_identity_group.billing_users[0].name
      } : null

      # Identity groups for this team
      identity_groups = {
        for group_key, group in local.google_identity_groups :
        split("-", group_key)[length(split("-", team_key))] => {
          description  = group.description
          display_name = group.display_name
          email        = google_cloud_identity_group.this[group_key].group_key[0].id
          role         = split("-", group_key)[length(split("-", team_key))]
        }
        if startswith(group_key, "${team_key}-")
      }

      # GitHub Repositories for this team
      github_repositories = {
        for repo_key, repo in local.github_repositories :
        repo_key => {
          full_name = github_repository.this[repo_key].full_name
          html_url  = github_repository.this[repo_key].html_url
          name      = github_repository.this[repo_key].name
        }
        if repo.team_key == team_key
      }

      # Google Kubernetes Engine clusters for this team
      google_kubernetes_engine_clusters = lookup(team, "google_kubernetes_engine_clusters", {})

      # Google subnets for this team (regional organization)
      google_subnets = lookup(team, "google_subnets", {})

      # Folder hierarchy
      team_folder_id      = google_folder.team[team_key].id
      team_type           = team.team_type
      team_type_folder_id = var.google_team_type_folder_ids[team.team_type]
    }
  }
}
