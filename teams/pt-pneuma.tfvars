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

    google_identity_groups_memberships = {
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
          production = {
            name = "Production: Main"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
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
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.0.0/21"
        }

        "pt-pneuma-us-east1-b" = {
          ip_cidr_range          = "10.62.8.0/21"
          pod_ip_cidr_range      = "10.2.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.8.0/21"
        }

        "pt-pneuma-us-east1-c" = {
          ip_cidr_range          = "10.62.16.0/21"
          pod_ip_cidr_range      = "10.4.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.40.0/21"
        }
      }

      "us-east4" = {
        "pt-pneuma-us-east4-a" = {
          ip_cidr_range          = "10.62.24.0/21"
          pod_ip_cidr_range      = "10.6.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.16.0/21"
        }

        "pt-pneuma-us-east4-b" = {
          ip_cidr_range          = "10.62.32.0/21"
          pod_ip_cidr_range      = "10.8.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.24.0/21"
        }

        "pt-pneuma-us-east4-c" = {
          ip_cidr_range          = "10.62.40.0/21"
          pod_ip_cidr_range      = "10.10.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.32.0/21"
        }
      }
    }

    team_type = "platform-team"
  }
}
