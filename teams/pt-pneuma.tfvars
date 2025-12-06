team = {
  pt-pneuma = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Pneuma" # The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation.

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
      "pt-pneuma" = {
        enable_gke_hub_host = true
        node_pools = {
          default-pool = {
            machine_type   = "e2-standard-2"
            max_node_count = 1
            min_node_count = 0
          }
        }
      }
    }

    github_repositories = {
      "pt-pneuma" = {
        description = "The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation." # This can be inferred from the team description (NOTE: need a description in the variable).

        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          non-production = {
            name = "Non-Production: Main"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east1-a = {
            name = "Non-Production cert-manager: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east1-a = {
            name = "Non-Production Datadog: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east1-a = {
            name = "Non-Production Istio: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-onboarding-us-east1-a = {
            name = "Non-Production Onboarding: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-opa-gatekeeper-us-east1-a = {
            name = "Non-Production OPA Gatekeeper: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-regional-us-east1-a = {
            name = "Non-Production: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east1-b = {
            name = "Non-Production cert-manager: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east1-b = {
            name = "Non-Production Datadog: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east1-b = {
            name = "Non-Production Istio: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-onboarding-us-east1-b = {
            name = "Non-Production Onboarding: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-opa-gatekeeper-us-east1-b = {
            name = "Non-Production OPA Gatekeeper: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-regional-us-east1-b = {
            name = "Non-Production: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east1-c = {
            name = "Non-Production cert-manager: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east1-c = {
            name = "Non-Production Datadog: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east1-c = {
            name = "Non-Production Istio: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-onboarding-us-east1-c = {
            name = "Non-Production Onboarding: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-opa-gatekeeper-us-east1-c = {
            name = "Non-Production OPA Gatekeeper: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-regional-us-east1-c = {
            name = "Non-Production: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east4-a = {
            name = "Non-Production cert-manager: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east4-a = {
            name = "Non-Production Datadog: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east4-a = {
            name = "Non-Production Istio: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-onboarding-us-east4-a = {
            name = "Non-Production Onboarding: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-opa-gatekeeper-us-east4-a = {
            name = "Non-Production OPA Gatekeeper: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-regional-us-east4-a = {
            name = "Non-Production: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east4-b = {
            name = "Non-Production cert-manager: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east4-b = {
            name = "Non-Production Datadog: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east4-b = {
            name = "Non-Production Istio: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-onboarding-us-east4-b = {
            name = "Non-Production Onboarding: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-opa-gatekeeper-us-east4-b = {
            name = "Non-Production OPA Gatekeeper: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-regional-us-east4-b = {
            name = "Non-Production: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east4-c = {
            name = "Non-Production cert-manager: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east4-c = {
            name = "Non-Production Datadog: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east4-c = {
            name = "Non-Production Istio: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-onboarding-us-east4-c = {
            name = "Non-Production Onboarding: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-opa-gatekeeper-us-east4-c = {
            name = "Non-Production OPA Gatekeeper: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-regional-us-east4-c = {
            name = "Non-Production: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          production = {
            name = "Production: Main"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east1-a = {
            name = "Production cert-manager: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east1-a = {
            name = "Production Datadog: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east1-a = {
            name = "Production Istio: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-onboarding-us-east1-a = {
            name = "Production Onboarding: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-opa-gatekeeper-us-east1-a = {
            name = "Production OPA Gatekeeper: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-regional-us-east1-a = {
            name = "Production: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east1-b = {
            name = "Production cert-manager: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east1-b = {
            name = "Production Datadog: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east1-b = {
            name = "Production Istio: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-onboarding-us-east1-b = {
            name = "Production Onboarding: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-opa-gatekeeper-us-east1-b = {
            name = "Production OPA Gatekeeper: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-regional-us-east1-b = {
            name = "Production: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east1-c = {
            name = "Production cert-manager: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east1-c = {
            name = "Production Datadog: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east1-c = {
            name = "Production Istio: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-onboarding-us-east1-c = {
            name = "Production Onboarding: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-opa-gatekeeper-us-east1-c = {
            name = "Production OPA Gatekeeper: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-regional-us-east1-c = {
            name = "Production: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east4-a = {
            name = "Production cert-manager: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east4-a = {
            name = "Production Datadog: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east4-a = {
            name = "Production Istio: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-onboarding-us-east4-a = {
            name = "Production Onboarding: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-opa-gatekeeper-us-east4-a = {
            name = "Production OPA Gatekeeper: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-regional-us-east4-a = {
            name = "Production: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east4-b = {
            name = "Production cert-manager: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east4-b = {
            name = "Production Datadog: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east4-b = {
            name = "Production Istio: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-onboarding-us-east4-b = {
            name = "Production Onboarding: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-opa-gatekeeper-us-east4-b = {
            name = "Production OPA Gatekeeper: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-regional-us-east4-b = {
            name = "Production: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east4-c = {
            name = "Production cert-manager: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east4-c = {
            name = "Production Datadog: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east4-c = {
            name = "Production Istio: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-onboarding-us-east4-c = {
            name = "Production Onboarding: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-opa-gatekeeper-us-east4-c = {
            name = "Production OPA Gatekeeper: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-regional-us-east4-c = {
            name = "Production: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          sandbox = {
            name = "Sandbox: Main"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east1-a = {
            name = "Sandbox cert-manager: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east1-a = {
            name = "Sandbox Datadog: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-us-east1-a = {
            name = "Sandbox Istio: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-onboarding-us-east1-a = {
            name = "Sandbox Onboarding: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-opa-gatekeeper-us-east1-a = {
            name = "Sandbox OPA Gatekeeper: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east1-a = {
            name = "Sandbox: us-east1-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east1-b = {
            name = "Sandbox cert-manager: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east1-b = {
            name = "Sandbox Datadog: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-us-east1-b = {
            name = "Sandbox Istio: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-onboarding-us-east1-b = {
            name = "Sandbox Onboarding: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-opa-gatekeeper-us-east1-b = {
            name = "Sandbox OPA Gatekeeper: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east1-b = {
            name = "Sandbox: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east1-c = {
            name = "Sandbox cert-manager: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east1-c = {
            name = "Sandbox Datadog: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-us-east1-c = {
            name = "Sandbox Istio: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-onboarding-us-east1-c = {
            name = "Sandbox Onboarding: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-opa-gatekeeper-us-east1-c = {
            name = "Sandbox OPA Gatekeeper: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east1-c = {
            name = "Sandbox: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east4-a = {
            name = "Sandbox cert-manager: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east4-a = {
            name = "Sandbox Datadog: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-us-east4-a = {
            name = "Sandbox Istio: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-onboarding-us-east4-a = {
            name = "Sandbox Onboarding: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-opa-gatekeeper-us-east4-a = {
            name = "Sandbox OPA Gatekeeper: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east4-a = {
            name = "Sandbox: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east4-b = {
            name = "Sandbox cert-manager: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east4-b = {
            name = "Sandbox Datadog: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-us-east4-b = {
            name = "Sandbox Istio: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-onboarding-us-east4-b = {
            name = "Sandbox Onboarding: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-opa-gatekeeper-us-east4-b = {
            name = "Sandbox OPA Gatekeeper: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east4-b = {
            name = "Sandbox: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east4-c = {
            name = "Sandbox cert-manager: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east4-c = {
            name = "Sandbox Datadog: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-us-east4-c = {
            name = "Sandbox Istio: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-onboarding-us-east4-c = {
            name = "Sandbox Onboarding: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-opa-gatekeeper-us-east4-c = {
            name = "Sandbox OPA Gatekeeper: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east4-c = {
            name = "Sandbox: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/pt-pneuma" # This can be inferred from the team association.
        ]

        topics = [
          "google-cloud-platform",
          "kubernetes",
          "opentofu"
        ]
      }
    }

    google_subnets = {
      "us-east1" = {
        "pt-pneuma-us-east1-a" = {
          ip_cidr_range          = "10.62.0.0/21"
          pod_ip_cidr_range      = "10.0.0.0/15"
          services_ip_cidr_range = "10.63.0.0/21"
        }

        "pt-pneuma-us-east1-b" = {
          ip_cidr_range          = "10.62.8.0/21"
          pod_ip_cidr_range      = "10.2.0.0/15"
          services_ip_cidr_range = "10.63.8.0/21"
        }

        "pt-pneuma-us-east1-c" = {
          ip_cidr_range          = "10.62.16.0/21"
          pod_ip_cidr_range      = "10.4.0.0/15"
          services_ip_cidr_range = "10.63.40.0/21"
        }
      }

      "us-east4" = {
        "pt-pneuma-us-east4-a" = {
          ip_cidr_range          = "10.62.24.0/21"
          pod_ip_cidr_range      = "10.6.0.0/15"
          services_ip_cidr_range = "10.63.16.0/21"
        }

        "pt-pneuma-us-east4-b" = {
          ip_cidr_range          = "10.62.32.0/21"
          pod_ip_cidr_range      = "10.8.0.0/15"
          services_ip_cidr_range = "10.63.24.0/21"
        }

        "pt-pneuma-us-east4-c" = {
          ip_cidr_range          = "10.62.40.0/21"
          pod_ip_cidr_range      = "10.10.0.0/15"
          services_ip_cidr_range = "10.63.32.0/21"
        }
      }
    }

    team_type = "platform-team"
  }
}
