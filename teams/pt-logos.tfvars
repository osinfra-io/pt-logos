team = {
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
      # pt-logos owns this repository as the foundational governance team responsible for
      # org-wide standards and shared tooling.
      "pt-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions shared across all platform team repositories."

        push_allowances = [
          "osinfra-io/pt-logos"
        ]

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-logos"
        ]
      }

      "pt-logos-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-logos team."

        push_allowances = [
          "osinfra-io/pt-logos"
        ]

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-logos"
        ]
      }

      "pt-logos" = {
        description = "The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously." # This can be inferred from the team description (NOTE: need a description in the variable).

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

        push_allowances = [
          "osinfra-io/pt-logos" # This can be inferred from the team association.
        ]

        topics = [
          "opentofu",
          "platform-team",
          "pt-logos"
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
