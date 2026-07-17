teams = {
  pt-corpus = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Corpus" # The embodiment of that order — the structural form where networks, shared services, and core infrastructure take shape, preparing the body that Pneuma will animate.

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
      "pt-corpus" = {
        description                       = "The embodiment of that order — the structural form where networks, shared services, and core infrastructure take shape, preparing the body that Pneuma will animate."
        enable_datadog_secrets            = true
        enable_datadog_webhook            = true
        enable_google_wif_service_account = true

        environments = {
          non-production = {
            name = "Non-Production: Main"
            reviewers = {
              teams = ["pt-corpus-non-production-approvers"]
            }
          }
          non-production-regional-us-east1 = {
            name = "Non-Production: Regional - us-east1"
            reviewers = {
              teams = ["pt-corpus-non-production-approvers"]
            }
          }
          non-production-regional-us-east4 = {
            name = "Non-Production: Regional - us-east4"
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
          production-regional-us-east1 = {
            name = "Production: Regional - us-east1"
            reviewers = {
              teams = ["pt-corpus-production-approvers"]
            }
          }
          production-regional-us-east4 = {
            name = "Production: Regional - us-east4"
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
          sandbox-regional-us-east1 = {
            name = "Sandbox: Regional - us-east1"
            reviewers = {
              teams = ["pt-corpus-sandbox-approvers"]
            }
          }
          sandbox-regional-us-east4 = {
            name = "Sandbox: Regional - us-east4"
            reviewers = {
              teams = ["pt-corpus-sandbox-approvers"]
            }
          }
        }

        topics = [
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-corpus"
        ]
      }

      "pt-corpus-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-corpus team."

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-corpus"
        ]
      }
    }

    github_repository_labels = {
      "copilot"      = { color = "6E40C9", description = "Copilot instructions, skills, hooks, and agents" }
      "dependencies" = { color = "0075CA", description = "Pull requests that update a dependency file" }
      "devex"        = { color = "84A255", description = "Developer experience, tooling, and local environment" }
      "docs"         = { color = "0052CC", description = "Docusaurus documentation site or other markdown documentation" }
      "nomos"        = { color = "FFB400", description = "Created by the Nomos agent" }
      "scripts"      = { color = "FBCA04", description = "Generator and utility scripts" }
      "security"     = { color = "B60205", description = "Driven by security requirements or hardening" }
      "tofu"         = { color = "FEDA15", description = "OpenTofu infrastructure code" }
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

    google_browser_groups_memberships = {
      non-production = {
        managers = ["pt-corpus-github@pt-corpus-tf61-nonprod.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
      production = {
        managers = ["pt-corpus-github@pt-corpus-tf16-prod.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
      sandbox = {
        managers = ["pt-corpus-github@pt-corpus-tfc9-sb.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
    }

    google_project_creator_groups_memberships = {
      non-production = {
        managers = ["pt-corpus-github@pt-corpus-tf61-nonprod.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
      production = {
        managers = ["pt-corpus-github@pt-corpus-tf16-prod.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
      sandbox = {
        managers = ["pt-corpus-github@pt-corpus-tfc9-sb.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
    }

    google_xpn_admin_groups_memberships = {
      non-production = {
        managers = ["pt-corpus-github@pt-corpus-tf61-nonprod.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
      production = {
        managers = ["pt-corpus-github@pt-corpus-tf16-prod.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
      sandbox = {
        managers = ["pt-corpus-github@pt-corpus-tfc9-sb.iam.gserviceaccount.com"]
        members  = []
        owners   = []
      }
    }

    team_type = "platform-team"
  }
}
