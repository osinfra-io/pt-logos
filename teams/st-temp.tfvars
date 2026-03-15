team = {
  st-temp = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Temp"

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

    github_repositories = {
      "st-temp-app" = {
        description = "Application workloads for the Temp stream-aligned team."

        enable_datadog_secrets            = true
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true

        environments = {
          non-production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Non-Production"
            reviewers = {
              teams = ["st-temp-non-production-approvers"]
            }
          }
          production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Production"
            reviewers = {
              teams = ["st-temp-production-approvers"]
            }
          }
          sandbox = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }
            name = "Sandbox"
            reviewers = {
              teams = ["st-temp-sandbox-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/st-temp"
        ]

        topics = [
          "st-temp",
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

    google_kubernetes_engine_clusters = {
      artifact_registry_groups_memberships = {
        readers = {
          managers = []
          members  = []
          owners   = []
        }
        writers = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
      }

      dns_subdomain = "temp"

      locations = {
        "us-east4-c" = {
          enable_gke_hub_host = false

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
            services_ip_cidr_range = "10.63.40.0/21"
          }
        }
      }
    }

    team_type = "stream-aligned-team"
  }
}
