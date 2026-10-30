teams = {
  st-ethos = {
    authentik_groups = {
      openbao-secret-admins = {
        description = "Manage secrets and versions within the st-ethos team prefix"
        label       = "OpenBao Secret Admins"

        members = {
          non-production = ["brett@osinfra.io"]
          production     = ["brett@osinfra.io"]
          sandbox        = ["brett@osinfra.io"]
        }
      }

      openbao-secret-readers = {
        description = "Read and list secrets within the st-ethos team prefix"
        label       = "OpenBao Secret Readers"

        members = {
          non-production = []
          production     = []
          sandbox        = []
        }
      }

      openbao-secret-writers = {
        description = "Create and update secrets within the st-ethos team prefix"
        label       = "OpenBao Secret Writers"

        members = {
          non-production = []
          production     = []
          sandbox        = []
        }
      }
    }

    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Ethos" # The lived moral character that customers experience — the trustworthiness, transparency, and integrity through which the business earns and keeps their confidence

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

    team_type = "stream-aligned-team"
  }
}
