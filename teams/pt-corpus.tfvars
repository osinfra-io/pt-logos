team = {
  pt-corpus = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Corpus" # The embodiment of that order — the structural form where networks, shared services, and core infrastructure take shape, preparing the body that Pneuma will animate.

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

    github_repositories = {
      "pt-corpus" = {
        description = "The embodiment of that order — the structural form where networks, shared services, and core infrastructure take shape, preparing the body that Pneuma will animate." # This can be inferred from the team description (NOTE: need a description in the variable).

        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          non-production = {
            name = "Non-Production: Main"
            reviewers = {
              teams = ["pt-corpus-non-production-approvers"]
            }
          }
          production = {
            name = "Production: Main"
            reviewers = {
              teams = ["pt-corpus-production-approvers"]
            }
          }
          sandbox = {
            name = "Sandbox: Main"
            reviewers = {
              teams = ["pt-corpus-sandbox-approvers"]
            }
          }
        }

        push_allowances = [
          "osinfra-io/pt-corpus" # This can be inferred from the team association.
        ]

        topics = [
          "google-cloud-platform",
          "opentofu"
        ]
      }
    }

    subnets = {
      "us-east1" = {
        "pt-corpus-us-east1-a" = {
          ip_cidr_range          = "10.62.0.0/21"
          pod_ip_cidr_range      = "10.0.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.0.0/21"
        }

        "pt-corpus-us-east1-b" = {
          ip_cidr_range          = "10.62.8.0/21"
          pod_ip_cidr_range      = "10.2.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.8.0/21"
        }

        "pt-corpus-us-east1-c" = {
          ip_cidr_range          = "10.62.16.0/21"
          pod_ip_cidr_range      = "10.4.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.40.0/21"
        }
      }

      "us-east4" = {
        "pt-corpus-us-east4-a" = {
          ip_cidr_range          = "10.62.24.0/21"
          pod_ip_cidr_range      = "10.6.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.16.0/21"
        }

        "pt-corpus-us-east4-b" = {
          ip_cidr_range          = "10.62.32.0/21"
          pod_ip_cidr_range      = "10.8.0.0/15"
          service_project_number = "362793201562" # plt-k8s-tf39-sb
          services_ip_cidr_range = "10.63.24.0/21"
        }

        "pt-corpus-us-east4-c" = {
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
