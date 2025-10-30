team = {
  pneuma = {
    display_name = "Pneuma" # The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation.
    team_type    = "platform-team"

    github_parent_team = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    github_child_teams = {
      sandbox-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
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
    }

    datadog_team = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    google_identity_groups = {
      admin = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      writer = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      reader = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
    }
  }
}
