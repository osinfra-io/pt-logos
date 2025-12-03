# Input Variables
# https://opentofu.org/docs/language/values/variables

# This is only needed during bootstrapping.
# variable "billing_project" {
#   description = "The quota project to send in `user_project_override`, used for all requests sent from the provider. If set on a resource that supports sending the resource project, this value will supersede the resource project. This field is ignored if `user_project_override` is set to false or unset"
#   type        = string
# }

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

variable "github_datadog_webhook_api_key" {
  description = "The Datadog API key used for creating GitHub webhooks"
  type        = string
  sensitive   = true
}

variable "github_discord_webhook_api_key" {
  description = "The Discord API key used for creating GitHub webhooks"
  type        = string
  sensitive   = true
}

variable "github_token" {
  description = "The GitHub token to authenticate with the GitHub provider"
  type        = string
  sensitive   = true
}

variable "google_billing_account" {
  description = "The billing account ID to associate with budgets"
  type        = string
  default     = "01C550-A2C86B-B8F16B"
}

variable "google_customer_id" {
  description = "The unique customer ID assigned to you when you signed up for Google Workspace or Cloud Identity. You can look up this ID in your Admin console"
  type        = string
  default     = "C01hd34v8"
}

variable "google_monthly_budget_amount" {
  description = "Monthly budget amount in USD for environment folders"
  type        = number
  default     = 100
}

variable "google_primary_domain" {
  description = "The main domain associated with your Google Workspace account. By default, your users get a username at this domain"
  type        = string
  default     = "osinfra.io"
}

variable "google_team_type_folder_ids" {
  description = "Map of team type to their pre-created folder IDs"
  type        = map(string)
  default = {
    "platform-team"              = "831575438843" # Platform Teams folder ID
    "stream-aligned-team"        = "667305285655" # Stream-aligned Teams folder ID
    "complicated-subsystem-team" = "195659428881" # Complicated-subsystem Teams folder ID
    "enabling-team"              = "141076777961" # Enabling Teams folder ID
  }
}

variable "team" {
  description = <<-EOT
    A map of teams following Team Topologies methodology, with hardcoded environments (Sandbox/Non-Production/Production),
    hardcoded Google Cloud identity groups (3 standard roles at team level), hierarchical GitHub teams (customizable membership with admin protection),
    GitHub repositories with webhook configurations, Datadog teams (admin/member roles with admin protection), and optional project configurations.

    Organization owners/admins are managed via hardcoded lists in locals.tofu with lifecycle protection.

    Structure: team_key => { display_name, team_type, github_parent_team_memberships{maintainers,members}, github_child_teams_memberships{hardcoded}, google_identity_groups_memberships{hardcoded}, datadog_team_memberships{}, github_repositories{}, projects{} }
  EOT
  type = map(object({
    datadog_team_memberships = object({
      admins  = list(string)
      members = list(string)
    })

    display_name = string

    github_parent_team_memberships = object({
      maintainers = list(string)
      members     = list(string)
    })

    # GitHub child teams (hardcoded teams - only add members to predefined teams)
    github_child_teams_memberships = object({
      non-production-approvers = object({
        maintainers = list(string)
        members     = list(string)
      })
      production-approvers = object({
        maintainers = list(string)
        members     = list(string)
      })
      repository-administrators = object({
        maintainers = list(string)
        members     = list(string)
      })
      sandbox-approvers = object({
        maintainers = list(string)
        members     = list(string)
      })
    })

    google_identity_groups_memberships = object({
      admin = object({
        managers = list(string)
        members  = list(string)
        owners   = list(string)
      })
      reader = object({
        managers = list(string)
        members  = list(string)
        owners   = list(string)
      })
      writer = object({
        managers = list(string)
        members  = list(string)
        owners   = list(string)
      })
    })

    projects = optional(map(object({
      services = list(string)
    })), {})

    github_repositories = optional(map(object({
      description            = string
      enable_datadog_webhook = optional(bool, true)
      enable_discord_webhook = optional(bool, true)

      environments = optional(map(object({
        deployment_branch_policy = optional(object({
          custom_branch_policies = optional(bool, false)
          protected_branches     = optional(bool, true)
        }))
        name = string
        reviewers = object({
          teams = list(string)
        })
      })), {})

      push_allowances = list(string)
      topics          = list(string)
    })), {})

    google_kubernetes_engine_clusters = optional(map(object({
      enable_gke_hub_host = optional(bool, false)
      node_pools = map(object({
        machine_type   = string
        max_node_count = number
        min_node_count = number
      }))
    })), {})

    google_subnets = optional(map(map(object({
      ip_cidr_range          = string
      pod_ip_cidr_range      = string
      service_project_number = string
      services_ip_cidr_range = string
    }))), {})

    team_type = string
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

  validation {
    condition = alltrue([
      for team_key, team in var.team : (
        (team.team_type == "platform-team" && startswith(team_key, "pt-")) ||
        (team.team_type == "stream-aligned-team" && startswith(team_key, "st-")) ||
        (team.team_type == "complicated-subsystem-team" && startswith(team_key, "ct-")) ||
        (team.team_type == "enabling-team" && startswith(team_key, "et-"))
      )
    ])
    error_message = "Team key must start with the correct prefix for its type: pt- (platform-team), st- (stream-aligned-team), ct- (complicated-subsystem-team), et- (enabling-team)."
  }

}

# These three state_* variables are required for early variable evaluation for backend and provider configuration.
# They are defined in the GitHub Actions called workflows and should NOT be set in the OpenTofu configuration.

variable "state_bucket" {
  description = "The name of the GCS bucket to store state files"
  type        = string
}

variable "state_kms_encryption_key" {
  description = "The KMS encryption key for state and plan files"
  type        = string
}

variable "state_prefix" {
  description = "The prefix for state files in the GCS bucket"
  type        = string
}
