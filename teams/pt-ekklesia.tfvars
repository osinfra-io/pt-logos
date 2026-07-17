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

    github_repository_labels = {
      "copilot"      = { color = "6E40C9", description = "Copilot instructions, skills, hooks, and agents" }
      "dependencies" = { color = "0075CA", description = "Pull requests that update a dependency file" }
      "devex"        = { color = "84A255", description = "Developer experience, tooling, and local environment" }
      "docs"         = { color = "0052CC", description = "Docusaurus documentation site or other markdown documentation" }
      "nomos"        = { color = "FFB400", description = "Created by the Nomos agent" }
      "scripts"      = { color = "FBCA04", description = "Generator and utility scripts" }
      "security"     = { color = "B60205", description = "Driven by security requirements or hardening" }
      "tofu"         = { color = "FEDA15", description = "OpenTofu infrastructure code" }
    }

    google_basic_groups_env_memberships = {
      admin = {
        non-production = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        production = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        sandbox = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
      }
      reader = {
        non-production = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        production = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        sandbox = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
      }
      writer = {
        non-production = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        production = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        sandbox = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
      }
    }

    team_type = "platform-team"
  }
}
