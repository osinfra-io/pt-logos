teams = {
  pt-ekklesia = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Ekklesia" # The assembly of the called-out — where distinct capabilities are gathered into a unified body, deliberating and acting in concert toward shared platform purpose.

    github_child_teams_memberships = {
      repository-administrators = {
        maintainers = ["brettcurtis"]
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
        description            = "Platform documentation for the pt-ekklesia team powered by Docusaurus and deployed via GitHub Pages."
        enable_datadog_webhook = true
        enable_ruleset         = true

        pages = {
          build_type = "workflow"
          cname      = "docs.osinfra.io"
        }

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
