teams = {
  st-ethos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Ethos" # The lived moral character that customers experience — the trustworthiness, transparency, and integrity through which the business earns and keeps their confidence

    github_parent_team_memberships = {
      maintainers = []
      members     = []
    }

    google_basic_groups_memberships = {
      admin = {
        managers = []
        members  = []
        owners   = []
      }
      reader = {
        managers = []
        members  = []
        owners   = []
      }
      writer = {
        managers = []
        members  = []
        owners   = []
      }
    }

    platform_managed_project = {
      cloud_sql = {
        database_version = "POSTGRES_16"
        machine_tier     = "db-f1-micro"
        regions          = ["us-east1", "us-east4"]
      }
    }

    team_type = "stream-aligned-team"
  }
}
