teams = {
  st-test = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Test"

    enable_opentofu_state_management = false
    enable_workflows                 = false

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
        maintainers = []
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
      "st-test" = {
        description                       = "Test"
        enable_datadog_secrets            = false
        enable_datadog_webhook            = true
        enable_google_wif_service_account = false
        enable_ruleset                    = true

        topics = [
          "st-test",
          "stream-aligned-team"
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

    team_type = "stream-aligned-team"
  }
}
