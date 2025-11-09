team = {
  pt-logos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Logos" # The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously.

    github_parent_team_memberships = {
      maintainers = ["brettcurtis"]
      members     = []
    }

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

    github_repositories = {
      "pt-logos" = {
        description = "The foundational principle of order across systems, integrating multi-provider infrastructure, establishing boundaries, governance, and stable standards for teams to operate autonomously." # This can be inferred from the team description (NOTE: need a description in the variable).

        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          production-pt-corpus = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-corpus"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          production-pt-logos = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-logos"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          production-pt-pneuma = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: pt-pneuma"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
          production-st-ethos = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production: st-ethos"
            reviewers = {
              teams = ["pt-logos-production-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/pt-logos" # This can be inferred from the team association.
        ]

        topics = [
          "opentofu"
        ]
      }
    }

    google_identity_groups_memberships = {
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
