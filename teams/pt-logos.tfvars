team = {
  logos = {
    display_name = "Logos" # The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously.
    team_type    = "platform-team"

    github_parent_team = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    github_child_teams = {
      sandbox-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      non-production-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      production-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      repository-administrators = {
        maintainers = ["brettcurtis"]
        members     = []
      }
    }

    datadog_team = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    google_identity_groups = {
      admin = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      writer = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      reader = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
    }
    repositories = {
      "pt-logos" = {
        description = "The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously." # This can be inferred from the team description (NOTE: need a description in the variable).

        topics = [
          "osinfra",       # This can be set for all repositories in the org.
          "platform-team", # this could be inferred from the team association.
          "opentofu"
        ]

        push_allowances = [
          "osinfra-io/pt-logos" # This can be inferred from the team association.
        ]

        enable_discord_webhook = true
        enable_datadog_webhook = true
      }
    }
  }
}
