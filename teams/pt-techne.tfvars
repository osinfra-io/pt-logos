team = {
  pt-techne = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Techne" # The practiced art of making — the disciplined craft through which raw materials of infrastructure are shaped into purposeful, refined platform instruments.

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

    github_parent_team_memberships = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    github_repositories = {
      "pt-techne-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-techne team."

        push_allowances = [
          "osinfra-io/pt-techne"
        ]

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-misc-workflows" = {
        description = "Miscellaneous reusable GitHub Called Workflows for common platform automation tasks."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-techne"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-opentofu-codespace" = {
        description = "GitHub Codespace for OpenTofu Infrastructure as Code development providing standardized developer environments."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-techne"
        ]

        topics = [
          "codespace",
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-opentofu-workflows" = {
        description = "Reusable GitHub Called Workflow examples for OpenTofu and Google Cloud Platform."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          non-production = {
            name = "Non-Production: Main"
            reviewers = {
              teams = ["pt-techne-non-production-approvers"]
            }
          }
          production = {
            name = "Production: Main"
            reviewers = {
              teams = ["pt-techne-production-approvers"]
            }
          }
          sandbox = {
            name = "Sandbox: Main"
            reviewers = {
              teams = ["pt-techne-sandbox-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/pt-techne"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-pre-commit-hooks" = {
        description = "Pre-commit hooks for Infrastructure as Code (IaC) tools including OpenTofu format, validate, and test."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-techne"
        ]

        topics = [
          "github-actions",
          "golang",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pre-commit",
          "pt-techne"
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
