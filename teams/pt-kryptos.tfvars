teams = {
  pt-kryptos = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Kryptos" # The hidden foundation of platform security — managing cryptographic primitives, secrets infrastructure, and security controls that underpin all teams on the platform.

    enable_google_project            = true
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
        description                       = "The hidden foundation of platform security — managing cryptographic primitives, secrets infrastructure, and security controls that underpin all teams on the platform."
        enable_datadog_secrets            = true
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true

        environments = {
          non-production-regional-us-east1-b = {
            name = "Non-Production: us-east1-b"
            reviewers = {
              teams = ["pt-kryptos-non-production-approvers"]
            }
          }
          non-production-regional-us-east4-a = {
            name = "Non-Production: us-east4-a"
            reviewers = {
              teams = ["pt-kryptos-non-production-approvers"]
            }
          }
          production-regional-us-east1-b = {
            name = "Production: us-east1-b"
            reviewers = {
              teams = ["pt-kryptos-production-approvers"]
            }
          }
          production-regional-us-east4-a = {
            name = "Production: us-east4-a"
            reviewers = {
              teams = ["pt-kryptos-production-approvers"]
            }
          }
          sandbox-regional-us-east1-b = {
            name = "Sandbox: us-east1-b"
            reviewers = {
              teams = ["pt-kryptos-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east4-a = {
            name = "Sandbox: us-east4-a"
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

    google_project_enable_datadog = true

    platform_managed_project = {
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

        dns_subdomain = "kryptos"

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

        namespaces = {
          "istio-test" = {
            istio_injection = "enabled"
          }
          "openbao" = {
            istio_injection = "disabled"
          }
        }
      }
    }

    team_type = "platform-team"
  }
}
