team = {
  pt-kratos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Kratos"

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

    google_kubernetes_engine_clusters = {
      artifact_registry_groups_memberships = {
        readers = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
        writers = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
      }

      dns_subdomain = "kratos"

      locations = {
        "us-east4-b" = {
          node_pools = {
            default-pool = {
              machine_type   = "e2-standard-2"
              max_node_count = 3
              min_node_count = 1
            }
          }

          subnet = {
            ip_cidr_range          = "10.62.0.0/21"
            master_ipv4_cidr_block = "10.63.240.0/28"
            pod_ip_cidr_range      = "10.0.0.0/15"
            services_ip_cidr_range = "10.62.248.0/21"
          }
        }
      }
    }

    team_type = "platform-team"
  }
}
