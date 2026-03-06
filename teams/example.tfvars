# Example Team Configuration - Complete Schema Reference
# This file demonstrates ALL possible configuration options for a team in pt-logos.
# Use this as a reference when creating or updating team configurations.
#
# Field Requirements:
# - REQUIRED fields must be present for every team
# - OPTIONAL fields can be omitted (defaults will be used or features disabled)
# - Some optional fields are only applicable to specific teams (e.g., pt-corpus)

team = {
  # Team key naming convention (MUST match team_type):
  # - Platform teams: pt-{name} (e.g., pt-pneuma, pt-corpus, pt-logos)
  # - Stream-aligned teams: st-{name} (e.g., st-ethos)
  # - Complicated-subsystem teams: ct-{name}
  # - Enabling teams: et-{name}
  "example-team" = {

    # ============================================================================
    # REQUIRED FIELDS
    # ============================================================================

    # Datadog team memberships (REQUIRED)
    # Email addresses for Datadog users
    # - admins: Can manage team members, settings, and all team resources
    # - members: Read-only access to team dashboards and monitors
    datadog_team_memberships = {
      admins  = ["admin@example.com"]
      members = ["member@example.com", "observer@example.com"]
    }

    # Team display name (REQUIRED)
    # Must be Title Case with no special characters except spaces
    # The word "and" is allowed in lowercase
    # Valid examples: "Logos", "Corpus", "Pneuma", "Ethos"
    # Invalid examples: "logos", "corpus-team", "Pneuma_Team"
    display_name = "Example"

    # GitHub child teams (REQUIRED - hardcoded structure)
    # Four predefined teams with customizable memberships
    # Control deployment approvals and repository administration
    # IMPORTANT: Use GitHub usernames (NOT email addresses)
    # Team naming: {team-key}-{child-team-name} (e.g., pt-pneuma-sandbox-approvers)
    github_child_teams_memberships = {
      # Sandbox environment approvers (lowest privilege level)
      # Must approve deployments to sandbox environments
      sandbox-approvers = {
        maintainers = ["github-username"]
        members     = []
      }

      # Non-production environment approvers (mid-level privilege)
      # Must approve deployments to non-production environments
      non-production-approvers = {
        maintainers = ["github-username"]
        members     = []
      }

      # Production environment approvers (highest privilege level)
      # Must approve deployments to production environments
      production-approvers = {
        maintainers = ["github-username"]
        members     = []
      }

      # Repository administrators (administrative privileges)
      # Can manage repository settings and configurations
      repository-administrators = {
        maintainers = ["github-username"]
        members     = []
      }
    }

    # GitHub parent team memberships (REQUIRED)
    # The main team that all child teams inherit from
    # All team members should be listed here
    # IMPORTANT: Use GitHub usernames (NOT email addresses)
    github_parent_team_memberships = {
      maintainers = ["github-username", "team-lead"]
      members     = ["contributor1", "contributor2"]
    }

    # Google Cloud Identity - Basic groups (REQUIRED)
    # Three standard IAM roles for GCP access control
    # Email addresses for Google Workspace or Cloud Identity users
    # These groups grant IAM permissions at the folder level
    google_basic_groups_memberships = {
      # Admin - Full control over team resources (roles/admin)
      # Can create/delete resources, manage IAM, and perform all operations
      admin = {
        managers = []
        members  = []
        owners   = ["admin@example.com"]
      }

      # Reader - Read-only access to team resources (roles/reader)
      # Can view resources but cannot make changes
      reader = {
        managers = []
        members  = []
        owners   = ["reader@example.com", "auditor@example.com"]
      }

      # Writer - Can modify team resources but not manage IAM (roles/writer)
      # Can create and update resources but cannot delete or manage permissions
      writer = {
        managers = []
        members  = []
        owners   = ["writer@example.com"]
      }
    }

    # Team type (REQUIRED)
    # Must be one of these Team Topologies types and match the team key prefix
    # - "platform-team"              - Provides internal platform services (prefix: pt-)
    # - "stream-aligned-team"        - Delivers features to end users (prefix: st-)
    # - "complicated-subsystem-team" - Manages complex technical subsystems (prefix: ct-)
    # - "enabling-team"              - Helps other teams adopt new technologies (prefix: et-)
    team_type = "platform-team"

    # ============================================================================
    # OPTIONAL FIELDS
    # ============================================================================

    # Kubernetes configuration (OPTIONAL)
    # Only specify if the team needs GKE clusters, DNS zones, or Artifact Registry
    google_kubernetes_engine_clusters = {

      # DNS subdomain for team services (OPTIONAL)
      # If omitted, defaults to team key with prefix removed (e.g., pt-pneuma → pneuma)
      # Creates DNS zones: {subdomain}.osinfra.io (prod), {subdomain}.sb.osinfra.io (sandbox)
      # Typically only set when you want a subdomain different from the team key
      dns_subdomain = "example"

      # Artifact Registry groups (OPTIONAL)
      # Only specify if the team needs container registries
      # Creates two groups for registry access control:
      # - readers: Can pull container images (roles/artifactregistry.reader)
      # - writers: Can push container images (roles/artifactregistry.writer)
      # NOTE: pt-pneuma service accounts are automatically added as managers to readers
      # NOTE: pt-corpus service accounts are automatically added as managers to writers
      artifact_registry_groups_memberships = {
        readers = {
          managers = []
          members  = []
          owners   = ["registry-reader@example.com"]
        }
        writers = {
          managers = []
          members  = []
          owners   = ["registry-writer@example.com"]
        }
      }

      # GKE clusters (OPTIONAL)
      # Organized by region, with embedded subnet and node pool configurations
      # When specified, pt-corpus automatically creates:
      # - A Kubernetes project for the team
      # - VPC subnets for each cluster
      # - DNS zones for team services
      # When specified, pt-pneuma deploys the clusters with all configurations
      regions = {
        # These are the only supported regions for the platform
        "us-east1" = {
          # Cluster name MUST follow pattern: {team-key}-{region}-{zone}
          # Example: pt-pneuma-us-east1-b, example-team-us-east4-a
          "example-team-us-east1-b" = {

            # Enable GKE Hub Host (OPTIONAL, default: false)
            # Set true for ONE cluster ONLY (across all teams) to act as the fleet host
            # The fleet host cluster manages:
            # - Multi-cluster service discovery (MCS)
            # - Cross-cluster ingress and egress
            # - Fleet-wide policies
            # All other clusters (across all teams) register to this host
            # Example: pt-pneuma-us-east1-b is configured as the fleet host
            enable_gke_hub_host = true

            # Node pools configuration (REQUIRED)
            # At least one pool (typically "default-pool") must be defined
            # Each pool supports autoscaling within min/max bounds
            node_pools = {
              default-pool = {
                machine_type   = "e2-standard-2" # GCE machine type
                max_node_count = 3               # Maximum nodes for autoscaling
                min_node_count = 1               # Minimum nodes (can be 0 for cost savings)
              }
              # Additional node pools can be added for specialized workloads
              # Example: high-memory pool, GPU pool, preemptible pool
            }

            # Subnet configuration (REQUIRED) - Defines all networking for this cluster
            # These IP ranges are created in the shared VPC by pt-corpus
            # All ranges must be non-overlapping across all teams and environments
            subnet = {
              # Primary IP range for cluster nodes (must be /21 or larger)
              ip_cidr_range = "10.62.8.0/21"

              # Control plane (master) IP range (MUST be /28)
              # Used for the GKE control plane private endpoint
              master_ipv4_cidr_block = "10.63.240.16/28"

              # Secondary IP range for pods (must be /14 or larger for large clusters)
              # Each node allocates a /24 from this range for its pods
              pod_ip_cidr_range = "10.2.0.0/15"

              # Secondary IP range for services (must be large enough for all services)
              # Each Kubernetes Service gets one IP from this range
              services_ip_cidr_range = "10.63.8.0/21"
            }
          }

          # Additional clusters in same region
          "example-team-us-east1-c" = {
            # Non-host clusters should omit enable_gke_hub_host or set to false
            # These clusters register to the fleet host for multi-cluster services
            node_pools = {
              default-pool = {
                machine_type   = "e2-standard-2"
                max_node_count = 3
                min_node_count = 1
              }
            }
            subnet = {
              ip_cidr_range          = "10.62.16.0/21"
              master_ipv4_cidr_block = "10.63.240.32/28"
              pod_ip_cidr_range      = "10.4.0.0/15"
              services_ip_cidr_range = "10.63.40.0/21"
            }
          }
        }

        # Only us-east1 and us-east4 regions are supported
        # Each region can contain multiple clusters in different zones
        "us-east4" = {
          "example-team-us-east4-a" = {
            node_pools = {
              default-pool = {
                machine_type   = "e2-standard-2"
                max_node_count = 3
                min_node_count = 1
              }
            }
            subnet = {
              ip_cidr_range          = "10.62.24.0/21"
              master_ipv4_cidr_block = "10.63.240.48/28"
              pod_ip_cidr_range      = "10.6.0.0/15"
              services_ip_cidr_range = "10.63.16.0/21"
            }
          }
        }
      }
    }
    # Environment-specific console access for pt-corpus service accounts
    # Allows pt-corpus to browse GCP console to discover resources across all teams
    # Only used in pt-corpus team configuration - omit for other teams
    # Grants roles/browser at the environment folder level
    google_browser_groups_memberships = {
      sandbox = {
        managers = []
        members  = []
        owners   = []
      }
      non-production = {
        managers = []
        members  = []
        owners   = []
      }
      production = {
        managers = []
        members  = []
        owners   = []
      }
    }

    # Google Browser groups (OPTIONAL - pt-corpus only)
    # Allows pt-corpus service accounts to create GCP projects in team folders
    # Only used in pt-corpus team configuration - omit for other teams
    # Grants roles/resourcemanager.projectCreator at the environment folder level
    google_project_creator_groups_memberships = {
      sandbox = {
        managers = []
        members  = []
        owners   = []
      }
      non-production = {
        managers = []
        members  = []
        owners   = []
      }
      production = {
        managers = []
        members  = []
        owners   = []
      }
    }

    # Google Shared VPC (XPN) Admin groups (OPTIONAL - pt-corpus only)
    # Allows pt-corpus service accounts to attach service projects to shared VPC
    # Only used in pt-corpus team configuration - omit for other teams
    # Grants roles/compute.xpnAdmin at the environment folder level
    google_xpn_admin_groups_memberships = {
      sandbox = {
        managers = []
        members  = []
        owners   = []
      }
      non-production = {
        managers = []
        members  = []
        owners   = []
      }
      production = {
        managers = []
        members  = []
        owners   = []
      }
    }

    # GitHub repositories (OPTIONAL)
    # Only specify repositories that this team owns and manages
    # Creates repositories, webhooks, environments, and workload identity bindings
    github_repositories = {
      # Repository name (key will be used as the repository name)
      "example-repo" = {
        # Repository description (REQUIRED)
        # Displayed on repository homepage
        description = "Example repository demonstrating all available options"

        # Enable Datadog secrets in repository secrets (OPTIONAL, default: false)
        # When true, adds DD_API_KEY and DD_APP_KEY to repository secrets
        enable_datadog_secrets = true

        # Enable Datadog webhook for monitoring (OPTIONAL, default: true)
        # When true, configures webhook to send events to Datadog
        enable_datadog_webhook = true

        # Enable Discord webhook for notifications (OPTIONAL, default: true)
        # When true, configures webhook to send notifications to Discord
        enable_discord_webhook = true

        # GitHub environments for deployment protection (OPTIONAL)
        # Can include main environments (sandbox, non-production, production)
        # and regional/component-specific environments for granular deployments
        # Omit entirely for repositories that don't need deployment protection
        environments = {
          # Sandbox environment with branch protection policy
          sandbox = {
            # deployment_branch_policy (OPTIONAL) - Controls which branches can deploy
            deployment_branch_policy = {
              custom_branch_policies = false # If true, uses custom branch patterns
              protected_branches     = true  # Only deployments from protected branches
            }
            # Environment display name (REQUIRED)
            name = "Sandbox"
            # Required reviewers before deployment (REQUIRED)
            reviewers = {
              teams = ["example-team-sandbox-approvers"]
            }
          }

          # Non-production main environment (common for monolithic workflows)
          non-production = {
            name = "Non-Production: Main"
            reviewers = {
              teams = ["example-team-non-production-approvers"]
            }
          }

          # Production main environment (common for monolithic workflows)
          production = {
            name = "Production: Main"
            reviewers = {
              teams = ["example-team-production-approvers"]
            }
          }

          # Regional/component-specific environments (example pattern)
          # Useful for multi-region deployments or component-specific workflows
          # Example: pneuma has separate environments for each cluster/region/component
          # deployment_branch_policy is optional and can be omitted
          non-production-regional-us-east1-b = {
            name = "Non-Production: us-east1-b"
            reviewers = {
              teams = ["example-team-non-production-approvers"]
            }
          }
        }

        # Push allowances (REQUIRED) - Teams/users allowed to push to protected branches
        # Typically includes the team's parent GitHub team
        push_allowances = [
          "osinfra-io/example-team" # Usually inferred from team association
        ]

        # Repository topics (REQUIRED) - Tags for categorization and discovery
        # Used for searching and filtering in GitHub organization
        topics = [
          "opentofu",
          "google-cloud-platform",
          "kubernetes"
        ]
      }

      # Additional repositories - environments are optional
      "another-repo" = {
        description = "Another repository example without environments"

        # Repositories can omit environments if they don't need deployment protection
        # Common for libraries, tools, documentation, or simple automation repositories
        # Default webhook settings will be used (enable_datadog_webhook and enable_discord_webhook default to true)

        push_allowances = ["osinfra-io/example-team"]
        topics          = ["golang", "infrastructure"]
      }
    }

    # Google Cloud projects (OPTIONAL)
    # Additional GCP projects beyond the standard Kubernetes project
    # NOTE: This field is defined in the schema but not currently used by any downstream repos
    # Planned for future use when teams need additional projects (data, ML, etc.)
    projects = {
      # Project key (used to generate project ID)
      "data-platform" = {
        # List of GCP API services to enable in this project (REQUIRED)
        services = [
          "bigquery.googleapis.com",
          "dataflow.googleapis.com",
          "storage.googleapis.com"
        ]
      }

      "ml-training" = {
        services = [
          "aiplatform.googleapis.com",
          "compute.googleapis.com"
        ]
      }
    }
  }
}
