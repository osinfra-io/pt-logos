teams = {
  st-tiger = {
    authentik_groups = {
      "tiger-admins" = {
        description = "Administrator access to Tiger applications"
        label       = "Tiger Admins"

        members = {
          non-production = ["brett@osinfra.io"]
          production     = ["brett@osinfra.io"]
          sandbox        = ["brett@osinfra.io"]
        }
      }
      "tiger-users" = {
        description = "User access to Tiger applications"
        label       = "Tiger Users"

        members = {
          non-production = ["brett@osinfra.io"]
          production     = ["brett@osinfra.io"]
          sandbox        = ["brett@osinfra.io"]
        }
      }
    }

    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Tiger" # A stream-aligned team delivering value at speed. Named for the tiger: a powerful, agile, and focused predator.

    enable_google_project            = false
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
      "st-tiger-api" = {
        description                       = "Backend API service for the st-tiger team."
        enable_datadog_secrets            = true
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true
        enable_ruleset                    = true

        topics = [
          "st-tiger",
          "stream-aligned-team"
        ]
      }

      "st-tiger-frontend" = {
        description                       = "Frontend web application for the st-tiger team."
        enable_datadog_secrets            = true
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true
        enable_ruleset                    = true

        topics = [
          "st-tiger",
          "stream-aligned-team"
        ]
      }
    }

    github_repository_labels = {
      "actions"       = { color = "000000", description = "GitHub Actions workflows and automation" }
      "copilot"       = { color = "6E40C9", description = "Copilot instructions, skills, hooks, and agents" }
      "dependencies"  = { color = "0075CA", description = "Pull requests that update a dependency file" }
      "devex"         = { color = "84A255", description = "Developer experience, tooling, and local environment" }
      "docker"        = { color = "0DB7ED", description = "Docker images and container configuration" }
      "docs"          = { color = "25C2A0", description = "Docusaurus documentation site or other markdown documentation" }
      "kubernetes"    = { color = "326CE5", description = "Kubernetes manifests, Helm charts, and cluster configuration" }
      "misc"          = { color = "C5DEF5", description = "Miscellaneous work that does not fit another label" }
      "nomos"         = { color = "FFB400", description = "Created by the Nomos agent" }
      "observability" = { color = "632CA6", description = "Observability, monitoring, and alerting" }
      "opentofu"      = { color = "FEDA15", description = "OpenTofu infrastructure code" }
      "scripts"       = { color = "89E051", description = "Generator and utility scripts" }
      "security"      = { color = "B60205", description = "Driven by security requirements or hardening" }
      "tests"         = { color = "1D76DB", description = "Test coverage, test infrastructure, and evaluations" }
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

    platform_managed_project = {
      cloud_sql = {
        "tiger" = {
          database_version = "POSTGRES_16"
          machine_tier     = "db-f1-micro"
          regions          = ["us-east1"]
        }
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

        dns_subdomain      = "tiger"
        enable_datadog_apm = true

        locations = {
          "us-east1-b" = {
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

          "us-east1-c" = {
            enable_gke_hub_host = false
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
        }

        namespaces = {
          "api" = {
            mesh_enabled = true

            route_auth_policies = {
              "api" = {
                mode = "browser"

                required_groups = [
                  "st-tiger: Tiger Admins",
                  "st-tiger: Tiger Users"
                ]
              }
            }

            routes = {
              "api" = {
                path = "/api"
                port = 8080
                service = "st-tiger-api"
              }
            }
          }

          "frontend" = {
            mesh_enabled = true

            route_auth_policies = {
              "frontend" = {
                mode = "browser"

                required_groups = [
                  "st-tiger: Tiger Admins",
                  "st-tiger: Tiger Users"
                ]
              }
            }

            routes = {
              "frontend" = {
                path = "/"
                port = 8080
                service = "st-tiger-frontend"
              }
            }
          }
        }
      }
    }

    team_type = "stream-aligned-team"
  }
}
