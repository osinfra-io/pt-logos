team = {
  pt-ekklesia = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Ekklesia" # The assembly of the called-out — where distinct capabilities are gathered into a unified body, deliberating and acting in concert toward shared platform purpose.

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
      "pt-ekklesia" = {
        description = "Backstage developer portal running on Google Kubernetes Engine, providing a centralized platform service catalog and developer tooling."

        enable_datadog_secrets = true
        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          sandbox = {
            name = "Sandbox: Main"
            reviewers = {
              teams = ["pt-ekklesia-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east1-b = {
            name = "Sandbox: Regional - us-east1-b"
            reviewers = {
              teams = ["pt-ekklesia-sandbox-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/pt-ekklesia"
        ]

        topics = [
          "backstage",
          "github-actions",
          "google-cloud-platform",
          "kubernetes",
          "opentofu",
          "platform-team",
          "pt-ekklesia"
        ]
      }

      "pt-ekklesia-docs" = {
        description = "Platform documentation for the pt-ekklesia team powered by GitBook."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-ekklesia"
        ]

        topics = [
          "documentation",
          "github-actions",
          "platform-team",
          "pt-ekklesia"
        ]
      }

      "pt-ekklesia-repository-templates" = {
        description = "Repository templates providing standardized skeletons for creating new platform repositories."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-ekklesia"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-ekklesia",
          "repository-template"
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
