teams = {
  pt-kryptos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Kryptos" # The hidden foundation of platform security — managing cryptographic primitives, secrets infrastructure, and security controls that underpin all teams on the platform.

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
      "pt-kryptos" = {
        description = "The hidden foundation of platform security — managing cryptographic primitives, secrets infrastructure, and security controls that underpin all teams on the platform."

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
              teams = ["pt-kryptos-non-production-approvers"]
            }
          }
          production = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }

            name = "Production"

            reviewers = {
              teams = ["pt-kryptos-production-approvers"]
            }
          }
          sandbox = {
            deployment_branch_policy = {
              custom_branch_policies = false
              protected_branches     = true
            }

            name = "Sandbox"

            reviewers = {
              teams = ["pt-kryptos-sandbox-approvers"]
            }
          }
        }

        topics = [
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-kryptos"
        ]
      }

      "pt-kryptos-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-kryptos team."

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-kryptos"
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
          owners   = ["brett@osinfra.io"]
        }
        writers = {
          managers = []
          members  = []
          owners   = ["brett@osinfra.io"]
        }
      }

      dns_subdomain = "kryptos"

      enable_datadog = true

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
            ip_cidr_range          = "10.60.96.0/20"
            master_ipv4_cidr_block = "10.63.192.96/28"
            pod_ip_cidr_range      = "10.12.0.0/15"
            services_ip_cidr_range = "10.62.64.0/20"
          }
        }

        "us-east4-a" = {
          node_pools = {
            default-pool = {
              machine_type   = "e2-standard-2"
              max_node_count = 3
              min_node_count = 1
            }
          }
          subnet = {
            ip_cidr_range          = "10.60.112.0/20"
            master_ipv4_cidr_block = "10.63.192.112/28"
            pod_ip_cidr_range      = "10.14.0.0/15"
            services_ip_cidr_range = "10.62.80.0/20"
          }
        }
      }
    }

    enable_google_project         = true
    google_project_enable_datadog = true

    team_type = "platform-team"
  }
}
