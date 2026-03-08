team = {
  pt-arche = {
    datadog_team_memberships = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    display_name = "Arche" # The origin and first cause — the primordial source from which all platform foundations draw their initial form and essential nature.

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
      "pt-arche-core-helpers" = {
        description = "OpenTofu example module for helpers providing core platform functionality including workspace parsing, resource labeling, and logos integration for team and project management."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-datadog-google-integration" = {
        description = "OpenTofu example module that configures Datadog's GCP integration using Workload Identity Federation, Pub/Sub log export, Cloud Asset project feeds, and optional BigQuery and GCS for Cloud Cost Management."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "datadog",
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-google-kubernetes-engine" = {
        description = "OpenTofu example module that provisions a GKE cluster with Workload Identity, KMS encryption, CIS GKE Benchmark hardening, and GKE Fleet support for multi-cluster service discovery and ingress."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "kubernetes",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-google-network" = {
        description = "OpenTofu example module that creates a Shared VPC host project network with configurable firewall rules, regional subnetworks, VPC flow logging, optional Cloud NAT, and Cloud DNS managed zones."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-google-project" = {
        description = "OpenTofu example module that creates a GCP project with CIS GCP Benchmark compliance controls, billing budget alerts, Cloud Monitoring notification channels, and GCP API enablement."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-google-storage-bucket" = {
        description = "OpenTofu example module that creates a Google Cloud Storage bucket with uniform bucket-level access, public access prevention, optional object versioning, and customer-managed encryption key support."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-kubernetes-cert-manager" = {
        description = "OpenTofu example module for cert-manager on Google Kubernetes Engine."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "kubernetes",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-kubernetes-datadog-operator" = {
        description = "OpenTofu example module for the Datadog Kubernetes Operator on Google Kubernetes Engine."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "datadog",
          "github-actions",
          "google-cloud-platform",
          "kubernetes",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-kubernetes-istio" = {
        description = "OpenTofu example module that deploys the Istio service mesh on GKE using Helm charts with optional ingress gateway, Cloud Armor WAF protection, and cert-manager integration for mTLS."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "kubernetes",
          "opentofu",
          "platform-team",
          "pt-arche"
        ]
      }

      "pt-arche-kubernetes-opa-gatekeeper" = {
        description = "OpenTofu example module for Open Policy Agent Gatekeeper on Google Kubernetes Engine."

        enable_datadog_webhook = true
        enable_discord_webhook = true

        push_allowances = [
          "osinfra-io/pt-arche"
        ]

        topics = [
          "github-actions",
          "google-cloud-platform",
          "kubernetes",
          "opentofu",
          "platform-team",
          "pt-arche"
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

    team_type = "platform-team"
  }
}
