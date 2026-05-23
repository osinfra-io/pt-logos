teams = {
  et-test = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Test"

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

    platform_managed_project = {
      cloud_sql = {
        database_version = "POSTGRES_16"
        machine_tier     = "db-f1-micro"
        regions          = ["us-east1"]
      }

      enable_datadog = true

      kubernetes_engine = {
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

        dns_subdomain      = "test"
        enable_datadog_apm = true

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
              ip_cidr_range          = "10.60.128.0/20"
              master_ipv4_cidr_block = "10.63.192.128/28"
              pod_ip_cidr_range      = "10.16.0.0/15"
              services_ip_cidr_range = "10.62.96.0/20"
            }
          }

          "us-east1-c" = {
            node_pools = {
              default-pool = {
                machine_type   = "e2-standard-2"
                max_node_count = 3
                min_node_count = 1
              }
            }
            subnet = {
              ip_cidr_range          = "10.60.144.0/20"
              master_ipv4_cidr_block = "10.63.192.144/28"
              pod_ip_cidr_range      = "10.18.0.0/15"
              services_ip_cidr_range = "10.62.112.0/20"
            }
          }

          "us-east1-d" = {
            node_pools = {
              default-pool = {
                machine_type   = "e2-standard-2"
                max_node_count = 3
                min_node_count = 1
              }
            }
            subnet = {
              ip_cidr_range          = "10.60.160.0/20"
              master_ipv4_cidr_block = "10.63.192.160/28"
              pod_ip_cidr_range      = "10.20.0.0/15"
              services_ip_cidr_range = "10.62.128.0/20"
            }
          }
        }
      }
    }

    team_type = "enabling-team"
  }
}
