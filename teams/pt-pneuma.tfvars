team = {
  pt-pneuma = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Pneuma" # The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation.

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
      "pt-pneuma-ai-context" = {
        description = "Centralized AI context and GitHub Copilot instructions for the pt-pneuma team."

        push_allowances = [
          "osinfra-io/pt-pneuma"
        ]

        topics = [
          "copilot",
          "github",
          "osinfra",
          "platform-team",
          "pt-pneuma"
        ]
      }

      "pt-pneuma" = {
        description = "The breath of life animating the platform via Kubernetes, orchestrating dynamic, self-healing, and scalable services atop the Logos foundation." # This can be inferred from the team description (NOTE: need a description in the variable).

        enable_datadog_secrets = true
        enable_datadog_webhook = true
        enable_discord_webhook = true

        environments = {
          non-production = {
            name = "Non-Production: Main"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-istio-csr-us-east1-b = {
            name = "Non-Production cert-manager Istio CSR: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-istio-csr-us-east1-c = {
            name = "Non-Production cert-manager Istio CSR: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-istio-csr-us-east1-d = {
            name = "Non-Production cert-manager Istio CSR: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-istio-csr-us-east4-a = {
            name = "Non-Production cert-manager Istio CSR: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-istio-csr-us-east4-b = {
            name = "Non-Production cert-manager Istio CSR: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-istio-csr-us-east4-c = {
            name = "Non-Production cert-manager Istio CSR: us-east4-c"
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
          non-production-cert-manager-us-east1-c = {
            name = "Non-Production cert-manager: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-cert-manager-us-east1-d = {
            name = "Non-Production cert-manager: us-east1-d"
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
          non-production-cert-manager-us-east4-b = {
            name = "Non-Production cert-manager: us-east4-b"
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
          non-production-datadog-manifests-us-east1-b = {
            name = "Non-Production Datadog Manifests: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-manifests-us-east1-c = {
            name = "Non-Production Datadog Manifests: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-manifests-us-east1-d = {
            name = "Non-Production Datadog Manifests: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-manifests-us-east4-a = {
            name = "Non-Production Datadog Manifests: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-manifests-us-east4-b = {
            name = "Non-Production Datadog Manifests: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-manifests-us-east4-c = {
            name = "Non-Production Datadog Manifests: us-east4-c"
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
          non-production-datadog-us-east1-c = {
            name = "Non-Production Datadog: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-datadog-us-east1-d = {
            name = "Non-Production Datadog: us-east1-d"
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
          non-production-datadog-us-east4-b = {
            name = "Non-Production Datadog: us-east4-b"
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
          non-production-istio-manifests-us-east1-b = {
            name = "Non-Production Istio Manifests: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-manifests-us-east1-c = {
            name = "Non-Production Istio Manifests: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-manifests-us-east1-d = {
            name = "Non-Production Istio Manifests: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-manifests-us-east4-a = {
            name = "Non-Production Istio Manifests: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-manifests-us-east4-b = {
            name = "Non-Production Istio Manifests: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-manifests-us-east4-c = {
            name = "Non-Production Istio Manifests: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-test-us-east1-b = {
            name = "Non-Production Istio Test: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-test-us-east1-c = {
            name = "Non-Production Istio Test: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-test-us-east1-d = {
            name = "Non-Production Istio Test: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-test-us-east4-a = {
            name = "Non-Production Istio Test: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-test-us-east4-b = {
            name = "Non-Production Istio Test: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-test-us-east4-c = {
            name = "Non-Production Istio Test: us-east4-c"
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
          non-production-istio-us-east1-c = {
            name = "Non-Production Istio: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-non-production-approvers"]
            }
          }
          non-production-istio-us-east1-d = {
            name = "Non-Production Istio: us-east1-d"
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
          non-production-istio-us-east4-b = {
            name = "Non-Production Istio: us-east4-b"
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
          non-production-onboarding-us-east1-b = {
            name = "Non-Production Onboarding: us-east1-b"
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
          non-production-onboarding-us-east1-d = {
            name = "Non-Production Onboarding: us-east1-d"
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
          non-production-onboarding-us-east4-b = {
            name = "Non-Production Onboarding: us-east4-b"
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
          non-production-opa-gatekeeper-us-east1-b = {
            name = "Non-Production OPA Gatekeeper: us-east1-b"
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
          non-production-opa-gatekeeper-us-east1-d = {
            name = "Non-Production OPA Gatekeeper: us-east1-d"
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
          non-production-opa-gatekeeper-us-east4-b = {
            name = "Non-Production OPA Gatekeeper: us-east4-b"
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
          non-production-regional-us-east1-b = {
            name = "Non-Production: us-east1-b"
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
          non-production-regional-us-east1-d = {
            name = "Non-Production: us-east1-d"
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
          non-production-regional-us-east4-b = {
            name = "Non-Production: us-east4-b"
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
          production-cert-manager-istio-csr-us-east1-b = {
            name = "Production cert-manager Istio CSR: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-istio-csr-us-east1-c = {
            name = "Production cert-manager Istio CSR: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-istio-csr-us-east1-d = {
            name = "Production cert-manager Istio CSR: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-istio-csr-us-east4-a = {
            name = "Production cert-manager Istio CSR: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-istio-csr-us-east4-b = {
            name = "Production cert-manager Istio CSR: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-istio-csr-us-east4-c = {
            name = "Production cert-manager Istio CSR: us-east4-c"
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
          production-cert-manager-us-east1-c = {
            name = "Production cert-manager: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-cert-manager-us-east1-d = {
            name = "Production cert-manager: us-east1-d"
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
          production-cert-manager-us-east4-b = {
            name = "Production cert-manager: us-east4-b"
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
          production-datadog-manifests-us-east1-b = {
            name = "Production Datadog Manifests: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-manifests-us-east1-c = {
            name = "Production Datadog Manifests: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-manifests-us-east1-d = {
            name = "Production Datadog Manifests: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-manifests-us-east4-a = {
            name = "Production Datadog Manifests: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-manifests-us-east4-b = {
            name = "Production Datadog Manifests: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-manifests-us-east4-c = {
            name = "Production Datadog Manifests: us-east4-c"
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
          production-datadog-us-east1-c = {
            name = "Production Datadog: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-datadog-us-east1-d = {
            name = "Production Datadog: us-east1-d"
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
          production-datadog-us-east4-b = {
            name = "Production Datadog: us-east4-b"
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
          production-istio-manifests-us-east1-b = {
            name = "Production Istio Manifests: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-manifests-us-east1-c = {
            name = "Production Istio Manifests: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-manifests-us-east1-d = {
            name = "Production Istio Manifests: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-manifests-us-east4-a = {
            name = "Production Istio Manifests: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-manifests-us-east4-b = {
            name = "Production Istio Manifests: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-manifests-us-east4-c = {
            name = "Production Istio Manifests: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-test-us-east1-b = {
            name = "Production Istio Test: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-test-us-east1-c = {
            name = "Production Istio Test: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-test-us-east1-d = {
            name = "Production Istio Test: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-test-us-east4-a = {
            name = "Production Istio Test: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-test-us-east4-b = {
            name = "Production Istio Test: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-test-us-east4-c = {
            name = "Production Istio Test: us-east4-c"
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
          production-istio-us-east1-c = {
            name = "Production Istio: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-production-approvers"]
            }
          }
          production-istio-us-east1-d = {
            name = "Production Istio: us-east1-d"
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
          production-istio-us-east4-b = {
            name = "Production Istio: us-east4-b"
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
          production-onboarding-us-east1-b = {
            name = "Production Onboarding: us-east1-b"
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
          production-onboarding-us-east1-d = {
            name = "Production Onboarding: us-east1-d"
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
          production-onboarding-us-east4-b = {
            name = "Production Onboarding: us-east4-b"
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
          production-opa-gatekeeper-us-east1-b = {
            name = "Production OPA Gatekeeper: us-east1-b"
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
          production-opa-gatekeeper-us-east1-d = {
            name = "Production OPA Gatekeeper: us-east1-d"
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
          production-opa-gatekeeper-us-east4-b = {
            name = "Production OPA Gatekeeper: us-east4-b"
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
          production-regional-us-east1-b = {
            name = "Production: us-east1-b"
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
          production-regional-us-east1-d = {
            name = "Production: us-east1-d"
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
          production-regional-us-east4-b = {
            name = "Production: us-east4-b"
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
          sandbox-cert-manager-istio-csr-us-east1-b = {
            name = "Sandbox cert-manager Istio CSR: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-istio-csr-us-east1-c = {
            name = "Sandbox cert-manager Istio CSR: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-istio-csr-us-east1-d = {
            name = "Sandbox cert-manager Istio CSR: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-istio-csr-us-east4-a = {
            name = "Sandbox cert-manager Istio CSR: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-istio-csr-us-east4-b = {
            name = "Sandbox cert-manager Istio CSR: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-istio-csr-us-east4-c = {
            name = "Sandbox cert-manager Istio CSR: us-east4-c"
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
          sandbox-cert-manager-us-east1-c = {
            name = "Sandbox cert-manager: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-cert-manager-us-east1-d = {
            name = "Sandbox cert-manager: us-east1-d"
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
          sandbox-cert-manager-us-east4-b = {
            name = "Sandbox cert-manager: us-east4-b"
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
          sandbox-datadog-manifests-us-east1-b = {
            name = "Sandbox Datadog Manifests: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-manifests-us-east1-c = {
            name = "Sandbox Datadog Manifests: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-manifests-us-east1-d = {
            name = "Sandbox Datadog Manifests: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-manifests-us-east4-a = {
            name = "Sandbox Datadog Manifests: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-manifests-us-east4-b = {
            name = "Sandbox Datadog Manifests: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-manifests-us-east4-c = {
            name = "Sandbox Datadog Manifests: us-east4-c"
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
          sandbox-datadog-us-east1-c = {
            name = "Sandbox Datadog: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-datadog-us-east1-d = {
            name = "Sandbox Datadog: us-east1-d"
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
          sandbox-datadog-us-east4-b = {
            name = "Sandbox Datadog: us-east4-b"
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
          sandbox-istio-manifests-us-east1-b = {
            name = "Sandbox Istio Manifests: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-manifests-us-east1-c = {
            name = "Sandbox Istio Manifests: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-manifests-us-east1-d = {
            name = "Sandbox Istio Manifests: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-manifests-us-east4-a = {
            name = "Sandbox Istio Manifests: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-manifests-us-east4-b = {
            name = "Sandbox Istio Manifests: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-manifests-us-east4-c = {
            name = "Sandbox Istio Manifests: us-east4-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-test-us-east1-b = {
            name = "Sandbox Istio Test: us-east1-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-test-us-east1-c = {
            name = "Sandbox Istio Test: us-east1-c"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-test-us-east1-d = {
            name = "Sandbox Istio Test: us-east1-d"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-test-us-east4-a = {
            name = "Sandbox Istio Test: us-east4-a"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-test-us-east4-b = {
            name = "Sandbox Istio Test: us-east4-b"
            reviewers = {
              teams = ["pt-pneuma-sandbox-approvers"]
            }
          }
          sandbox-istio-test-us-east4-c = {
            name = "Sandbox Istio Test: us-east4-c"
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
          sandbox-istio-us-east1-d = {
            name = "Sandbox Istio: us-east1-d"
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
          sandbox-istio-us-east4-b = {
            name = "Sandbox Istio: us-east4-b"
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
          sandbox-onboarding-us-east1-b = {
            name = "Sandbox Onboarding: us-east1-b"
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
          sandbox-onboarding-us-east1-d = {
            name = "Sandbox Onboarding: us-east1-d"
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
          sandbox-onboarding-us-east4-b = {
            name = "Sandbox Onboarding: us-east4-b"
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
          sandbox-opa-gatekeeper-us-east1-b = {
            name = "Sandbox OPA Gatekeeper: us-east1-b"
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
          sandbox-opa-gatekeeper-us-east1-d = {
            name = "Sandbox OPA Gatekeeper: us-east1-d"
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
          sandbox-opa-gatekeeper-us-east4-b = {
            name = "Sandbox OPA Gatekeeper: us-east4-b"
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
          sandbox-regional-us-east1-b = {
            name = "Sandbox: us-east1-b"
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
          sandbox-regional-us-east1-d = {
            name = "Sandbox: us-east1-d"
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
          sandbox-regional-us-east4-b = {
            name = "Sandbox: us-east4-b"
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

      "pt-pneuma-istio-test" = {
        description = "Istio test application used to validate Istio service mesh configurations in the pt-pneuma Kubernetes platform."

        push_allowances = [
          "osinfra-io/pt-pneuma" # This can be inferred from the team association.
        ]

        topics = [
          "golang",
          "google-cloud-platform",
          "infrastructure-as-code",
          "opentofu"
        ]
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
          owners   = []
        }
      }

      locations = {
        "us-east1-b" = {
          enable_gke_hub_host = true
          node_pools = {
            default-pool = {
              machine_type   = "e2-standard-2"
              max_node_count = 1
              min_node_count = 0
            }
          }
          subnet = {
            ip_cidr_range          = "10.62.8.0/21"
            master_ipv4_cidr_block = "10.63.240.16/28"
            pod_ip_cidr_range      = "10.2.0.0/15"
            services_ip_cidr_range = "10.63.8.0/21"
          }
        }

        # "us-east1-c" = {
        #   node_pools = {
        #     default-pool = {
        #       machine_type   = "e2-standard-2"
        #       max_node_count = 1
        #       min_node_count = 0
        #     }
        #   }
        #   subnet = {
        #     ip_cidr_range          = "10.62.16.0/21"
        #     master_ipv4_cidr_block = "10.63.240.32/28"
        #     pod_ip_cidr_range      = "10.4.0.0/15"
        #     services_ip_cidr_range = "10.63.40.0/21"
        #   }
        # }

        # "us-east1-d" = {
        #   node_pools = {
        #     default-pool = {
        #       machine_type   = "e2-standard-2"
        #       max_node_count = 1
        #       min_node_count = 0
        #     }
        #   }
        #   subnet = {
        #     ip_cidr_range          = "10.62.0.0/21"
        #     master_ipv4_cidr_block = "10.63.240.0/28"
        #     pod_ip_cidr_range      = "10.0.0.0/15"
        #     services_ip_cidr_range = "10.63.0.0/21"
        #   }
        # }

        # "us-east4-a" = {
        #   node_pools = {
        #     default-pool = {
        #       machine_type   = "n1-standard-1"
        #       max_node_count = 1
        #       min_node_count = 0
        #     }
        #   }
        #   subnet = {
        #     ip_cidr_range          = "10.62.24.0/21"
        #     master_ipv4_cidr_block = "10.63.240.48/28"
        #     pod_ip_cidr_range      = "10.6.0.0/15"
        #     services_ip_cidr_range = "10.63.16.0/21"
        #   }
        # }

        "us-east4-b" = {
          node_pools = {
            default-pool = {
              machine_type   = "e2-standard-2"
              max_node_count = 1
              min_node_count = 0
            }
          }
          subnet = {
            ip_cidr_range          = "10.62.32.0/21"
            master_ipv4_cidr_block = "10.63.240.64/28"
            pod_ip_cidr_range      = "10.8.0.0/15"
            services_ip_cidr_range = "10.63.24.0/21"
          }
        }

        # "us-east4-c" = {
        #   node_pools = {
        #     default-pool = {
        #       machine_type   = "e2-standard-2"
        #       max_node_count = 1
        #       min_node_count = 0
        #     }
        #   }
        #   subnet = {
        #     ip_cidr_range          = "10.62.40.0/21"
        #     master_ipv4_cidr_block = "10.63.240.80/28"
        #     pod_ip_cidr_range      = "10.10.0.0/15"
        #     services_ip_cidr_range = "10.63.32.0/21"
        #   }
        # }
      }

      dns_subdomain = "pneuma"
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

    team_type = "platform-team"
  }
}
