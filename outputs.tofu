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

      # Identity groups for this team
      identity_groups = {
        for group_key, group in local.identity_groups :
        split("-", group_key)[1] => {
          description  = group.description
          display_name = group.display_name
          email        = google_cloud_identity_group.this[group_key].group_key[0].id
          role         = split("-", group_key)[1]
        }
        if startswith(group_key, "${team_key}-")
      }

      # Repositories for this team
      repositories = {
        for repo_key, repo in local.github_repositories :
        repo_key => {
          full_name = github_repository.this[repo_key].full_name
          html_url  = github_repository.this[repo_key].html_url
          name      = github_repository.this[repo_key].name
        }
        if repo.team_key == team_key
      }

      # Folder hierarchy
      team_folder_id   = google_folder.team[team_key].id
      team_type        = team.team_type
      team_type_folder = local.team_type_display_names[team.team_type]
    }
  }
}
