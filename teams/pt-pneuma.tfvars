team = {
  pneuma = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Pneuma" # The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation.

    github_parent_team_memberships = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    github_child_teams_memberships = {
      non-production-approvers = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      production-approvers = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      repository-administrators = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      sandbox-approvers = {
        maintainers = ["brettcurtis"]
        members     = []
      }
    }

    google_identity_groups_memberships = {
      admin = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      reader = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      writer = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
    }

    github_repositories = {
      "pt-pneuma" = {
        description = "The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation." # This can be inferred from the team description (NOTE: need a description in the variable).

        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          production = {
            name = "Production: Main"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/pt-pneuma" # This can be inferred from the team association.
        ]

        topics = [
          "google-cloud-platform",
          "kubernetes",
          "opentofu"
        ]
      }
    }

    team_type = "platform-team"
  }
}
