teams = {
  pt-techne = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Techne" # The practiced art of making — the disciplined craft through which raw materials of infrastructure are shaped into purposeful, refined platform instruments.

    enable_google_project            = true
    enable_opentofu_state_management = true
    enable_workflows                 = true

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
      "pt-techne-agents" = {
        description            = "AI agent definitions and Copilot coding agent configurations for the osinfra.io platform."
        enable_datadog_webhook = true

        topics = [
          "agent",
          "github-copilot",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-techne team."

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-development-setup" = {
        description            = "Local development environment setup scripts example for working with Infrastructure as Code (IaC)."
        enable_datadog_webhook = true

        topics = [
          "developer-tools",
          "docker",
          "opentofu",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-mcp-server" = {
        description            = "Model Context Protocol (MCP) server providing platform context and tools to AI assistants."
        enable_datadog_webhook = true

        topics = [
          "ai",
          "github-copilot",
          "mcp",
          "model-context-protocol",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-misc-workflows" = {
        description            = "Miscellaneous reusable GitHub Called Workflows for common platform automation tasks."
        enable_datadog_webhook = true

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-opentofu-codespace" = {
        description            = "GitHub Codespace for OpenTofu Infrastructure as Code development providing standardized developer environments."
        enable_datadog_webhook = true

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
        description                       = "Reusable GitHub Called Workflow examples for OpenTofu and Google Cloud Platform."
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true

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

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-techne"
        ]
      }

      "pt-techne-pre-commit-hooks" = {
        description            = "Pre-commit hooks for Infrastructure as Code (IaC) tools including OpenTofu format, validate, and test."
        enable_datadog_webhook = true

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
