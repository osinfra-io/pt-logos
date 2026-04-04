teams = {
  pt-ekklesia = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Ekklesia" # The assembly of the called-out — where distinct capabilities are gathered into a unified body, deliberating and acting in concert toward shared platform purpose.

    github_child_teams_memberships = {
      non-production-approvers = {
        maintainers = []
        members     = []
      }
      production-approvers = {
        maintainers = []
        members     = []
      }
      repository-administrators = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      sandbox-approvers = {
        maintainers = []
        members     = []
      }
    }

    github_parent_team_memberships = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    github_repositories = {
      "pt-ekklesia-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-ekklesia team."


        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-ekklesia"
        ]
      }

      "pt-ekklesia-docs" = {
        description            = "Platform documentation for the pt-ekklesia team powered by GitBook."
        enable_datadog_webhook = true
        enable_ruleset         = false


        topics = [
          "documentation",
          "platform-team",
          "pt-ekklesia"
        ]
      }
    }

    google_basic_groups_memberships = {
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

    team_type = "platform-team"
  }
}
