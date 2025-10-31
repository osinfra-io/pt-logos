team = {
  corpus = {
    display_name = "Corpus" # The embodiment of that order — the structural form where networks, shared services, and core infrastructure take shape, preparing the body that Pneuma will animate.
    team_type    = "platform-team"

    datadog_team = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    github_child_teams = {
      non-production-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      production-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      repository-administrators = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      sandbox-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
    }

    github_parent_team = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    google_identity_groups = {
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
  }
}
