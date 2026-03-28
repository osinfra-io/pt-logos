# Moved Blocks
# https://opentofu.org/docs/language/moved

moved {
  from = github_actions_secret.datadog_api_key
  to   = github_actions_secret.datadog_api_keys
}

moved {
  from = github_actions_secret.datadog_app_key
  to   = github_actions_secret.datadog_app_keys
}

moved {
  from = github_repository_file.release
  to   = github_repository_file.releases
}

moved {
  from = github_repository_file.security_policy
  to   = github_repository_file.security_policies
}

moved {
  from = github_repository_webhook.datadog
  to   = github_repository_webhook.datadog_webhooks
}

moved {
  from = google_folder.environment
  to   = google_folder.environments
}

moved {
  from = google_folder.team
  to   = google_folder.teams
}
