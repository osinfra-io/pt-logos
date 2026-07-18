teams = {
  pt-logos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Logos" # The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously.

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
      "pt-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions shared across all platform grouping team members."

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-logos"
        ]
      }

      "pt-ai-plugins" = {
        description = "Centralized GitHub Copilot CLI plugin marketplace shared across all platform grouping team members."

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-logos"
        ]
      }

      "pt-logos" = {
        description                       = "The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously."
        enable_datadog_secrets            = true
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true

        environments = {
          arche-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-arche"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          corpus-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-corpus"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          ekklesia-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-ekklesia"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          ethos-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: st-ethos"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          kryptos-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-kryptos"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          logos-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-logos"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          pneuma-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-pneuma"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          techne-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-techne"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
        }

        topics = [
          "opentofu",
          "platform-team",
          "pt-logos"
        ]
      }

      "pt-logos-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-logos team."

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-logos"
        ]
      }
    }

    github_repository_labels = {
      "actions"      = { color = "000000", description = "GitHub Actions workflows and automation" }
      "copilot"      = { color = "6E40C9", description = "Copilot instructions, skills, hooks, and agents" }
      "dependencies" = { color = "0075CA", description = "Pull requests that update a dependency file" }
      "devex"        = { color = "84A255", description = "Developer experience, tooling, and local environment" }
      "docs"         = { color = "0052CC", description = "Docusaurus documentation site or other markdown documentation" }
      "nomos"        = { color = "FFB400", description = "Created by the Nomos agent" }
      "opentofu"     = { color = "FEDA15", description = "OpenTofu infrastructure code" }
      "scripts"      = { color = "FBCA04", description = "Generator and utility scripts" }
      "security"     = { color = "B60205", description = "Driven by security requirements or hardening" }
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
