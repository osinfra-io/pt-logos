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
      team_type    = team.team_type

      # Folder hierarchy
      team_type_folder = local.team_type_display_names[team.team_type]
      team_folder_id   = google_folder.team[team_key].id

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
          email        = google_cloud_identity_group.this[group_key].group_key[0].id
          display_name = group.display_name
          description  = group.description
          role         = split("-", group_key)[1]
        }
        if startswith(group_key, "${team_key}-")
      }

    }
  }
}
