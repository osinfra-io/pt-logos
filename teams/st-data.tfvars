teams = {
  st-data = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Data"

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

    google_basic_groups_memberships = {
      admin = {
        managers = ["brett@osinfra.io"]
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      reader = {
        managers = ["brett@osinfra.io"]
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      writer = {
        managers = ["brett@osinfra.io"]
        members  = []
        owners   = ["brett@osinfra.io"]
      }
    }

    team_type = "stream-aligned-team"
  }
}
