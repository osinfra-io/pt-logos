# Input Variables
# https://opentofu.org/docs/language/values/variables

variable "billing_account" {
  description = "The billing account ID to associate with budgets"
  type        = string
  default     = "01C550-A2C86B-B8F16B"
}

# This is only needed during bootstrapping.
variable "billing_project" {
  description = "The quota project to send in `user_project_override`, used for all requests sent from the provider. If set on a resource that supports sending the resource project, this value will supersede the resource project. This field is ignored if `user_project_override` is set to false or unset"
  type        = string
}

variable "customer_id" {
  description = "The unique customer ID assigned to you when you signed up for Google Workspace or Cloud Identity. You can look up this ID in your Admin console"
  type        = string
  default     = "C01hd34v8"
}

variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Datadog APP key"
  type        = string
  sensitive   = true
}

variable "datadog_webhook_api_key" {
  description = "The Datadog API key used for creating webhooks"
  type        = string
  sensitive   = true
}

variable "discord_webhook_api_key" {
  description = "The Discord API key used for creating webhooks"
  type        = string
  sensitive   = true
}

variable "github_token" {
  description = "The GitHub token to authenticate with the GitHub provider"
  type        = string
  sensitive   = true
}

variable "monthly_budget_amount" {
  description = "Monthly budget amount in USD for environment folders"
  type        = number
  default     = 100
}

variable "primary_domain" {
  description = "The main domain associated with your Google Workspace account. By default, your users get a username at this domain"
  type        = string
  default     = "osinfra.io"
}

variable "team" {
  description = <<-EOT
    A map of teams following Team Topologies methodology, with hardcoded environments (Sandbox/Non-Production/Production),
    hardcoded Google Cloud identity groups (3 standard roles at team level), hierarchical GitHub teams (customizable membership with admin protection),
    GitHub repositories with webhook configurations, Datadog teams (admin/member roles with admin protection), and optional project configurations.

    Organization owners/admins are managed via hardcoded lists in locals.tofu with lifecycle protection.

    Structure: team_key => { display_name, team_type, github_parent_team{maintainers,members}, google_identity_groups{admin,writer,reader}, github_child_teams{}, datadog_team{}, repositories{}, projects{} }
  EOT
  type = map(object({
    display_name = string
    team_type    = string
    github_parent_team = object({
      maintainers = list(string)
      members     = list(string)
    })
    github_child_teams = object({
      sandbox-approver = object({
        maintainers = list(string)
        members     = list(string)
      })
      non-production-approver = object({
        maintainers = list(string)
        members     = list(string)
      })
      production-approver = object({
        maintainers = list(string)
        members     = list(string)
      })
      repository-administrators = object({
        maintainers = list(string)
        members     = list(string)
      })
    })
    datadog_team = object({
      admins  = list(string)
      members = list(string)
    })
    google_identity_groups = object({
      admin = object({
        managers = list(string)
        members  = list(string)
        owners   = list(string)
      })
      writer = object({
        managers = list(string)
        members  = list(string)
        owners   = list(string)
      })
      reader = object({
        managers = list(string)
        members  = list(string)
        owners   = list(string)
      })
    })
    projects = optional(map(object({
      services = list(string)
    })), {})
    repositories = optional(map(object({
      description            = string
      topics                 = list(string)
      push_allowances        = list(string)
      enable_discord_webhook = optional(bool, true)
      enable_datadog_webhook = optional(bool, true)
    })), {})
  }))

  validation {
    condition = alltrue([
      for team_key, team in var.team : contains(["stream-aligned-team", "platform-team", "complicated-subsystem-team", "enabling-team"], team.team_type)
    ])
    error_message = "Team type must be one of: stream-aligned-team, platform-team, complicated-subsystem-team, enabling-team."
  }

  validation {
    condition = alltrue([
      for team_key, team in var.team : can(regex("^[A-Z][A-Za-z0-9]*( (and|[A-Z][A-Za-z0-9]*) [A-Z][A-Za-z0-9]*| [A-Z][A-Za-z0-9]*)*$", team.display_name))
    ])
    error_message = "Team display_name must be in Title Case with no special characters except spaces. The word 'and' is allowed in lowercase (e.g., 'Platform Team', 'Trust and Safety')."
  }


}

variable "top_level_folder_id" {
  description = "The top level folder ID to create the team hierarchy under"
  type        = string
  default     = "405483259717"
}

# These three state_* variables are required for early variable evaluation for backend and provider configuration.
# They are defined in the GitHub Actions called workflows and should NOT be set in the OpenTofu configuration.

# variable "state_bucket" {
#   description = "The name of the GCS bucket to store state files"
#   type        = string
# }

# variable "state_kms_encryption_key" {
#   description = "The KMS encryption key for state and plan files"
#   type        = string
# }

# variable "state_prefix" {
#   description = "The prefix for state files in the GCS bucket"
#   type        = string
# }
