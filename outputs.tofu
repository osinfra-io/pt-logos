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
  value       = local.teams_output
}
