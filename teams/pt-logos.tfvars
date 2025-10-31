team = {
  logos = {
    display_name = "Logos" # The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously.
    team_type    = "platform-team"

    datadog_team = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    github_child_teams = {
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
      sandbox-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
    }

    github_parent_team = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    google_identity_groups = {
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

    repositories = {
      "pt-logos" = {
        description = "The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously." # This can be inferred from the team description (NOTE: need a description in the variable).

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-logos" # This can be inferred from the team association.
        ]

        topics = [
          "opentofu"
        ]
      }
    }
  }
}
