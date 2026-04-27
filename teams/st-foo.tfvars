teams = {
  st-foo = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Foo"

    enable_opentofu_state_management = true
    enable_workflows                 = true

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
        regions          = ["us-east4"]
      }

      enable_datadog = true

      kubernetes_engine = {
        dns_subdomain      = "foo"
        enable_datadog_apm = true

        locations = {
          "us-east4-b" = {
            enable_gke_hub_host = false
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
        }
      }
    }

    team_type = "stream-aligned-team"
  }
}
