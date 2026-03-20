team = {
  st-ethos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Ethos" # The guiding philosophy that shapes platform principles

    enable_opentofu_state_management = true
    enable_workflows                 = true

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

      dns_subdomain = "www"

      locations = {
        "us-east1-b" = {
          node_pools = {
            default-pool = {
              machine_type   = "e2-standard-2"
              max_node_count = 3
              min_node_count = 1
            }
          }
          subnet = {
            ip_cidr_range          = "10.62.48.0/21"
            master_ipv4_cidr_block = "10.63.240.96/28"
            pod_ip_cidr_range      = "10.12.0.0/15"
            services_ip_cidr_range = "10.62.248.0/21"
          }
        }

        "us-east4-b" = {
          node_pools = {
            default-pool = {
              machine_type   = "e2-standard-2"
              max_node_count = 3
              min_node_count = 1
            }
          }
          subnet = {
            ip_cidr_range          = "10.62.56.0/21"
            master_ipv4_cidr_block = "10.63.240.112/28"
            pod_ip_cidr_range      = "10.14.0.0/15"
            services_ip_cidr_range = "10.63.48.0/21"
          }
        }
      }
    }

    team_type = "stream-aligned-team"
  }
}
