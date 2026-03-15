terraform {
  # State and Plan Encryption
  # https://opentofu.org/docs/language/state/encryption

  # The commented out sections below demonstrate how to configure
  # fallback encryption methods for state and plan files for bootstrapping.

  encryption {
    key_provider "gcp_kms" "default" {
      key_length         = 32
      kms_encryption_key = var.state_kms_encryption_key
    }

    method "aes_gcm" "default" {
      keys = key_provider.gcp_kms.default
    }

    plan {
      method   = method.aes_gcm.default
      enforced = true
    }

    state {
      method   = method.aes_gcm.default
      enforced = true
    }
  }

  # Required Providers
  # https://opentofu.org/docs/language/providers/requirements#requiring-providers

  required_providers {

    datadog = {
      source = "datadog/datadog"
    }

    github = {
      source = "integrations/github"
    }

    # Google Cloud Platform Provider
    # https://search.opentofu.org/provider/hashicorp/google/latest/docs

    google = {
      source = "hashicorp/google"
    }
  }
}

# Datadog Provider
# https://search.opentofu.org/provider/opentofu/datadog/latest

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Github Provider
# https://search.opentofu.org/provider/integrations/github/latest/docs

# Some API operations may not be available when using a GitHub App installation configuration. For more information, refer to the list of
# supported operations: https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-installation-access-tokens

# provider "github" {
#   app_auth {
#     id              = "1081373"
#     installation_id = "58130651"
#     pem_file        = base64decode(var.app_pem_file_base64)
#   }

#   owner = "osinfra-io"
# }

provider "github" {
  owner = "osinfra-io"
  token = var.github_token
}

# Google Cloud Provider
# https://search.opentofu.org/provider/hashicorp/google/latest/docs

# This is only needed during bootstrapping.

# provider "google" {
#   billing_project       = var.billing_project
#   user_project_override = true
# }
