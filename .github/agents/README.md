# Agents

## logos.agent.md

Manages all logos-owned resources — onboard teams, add or remove members, manage repositories, GitHub environments, Google Cloud Platform projects, and Google Kubernetes Engine cluster configuration. Reads the current state and opens a pull request with every change.

**Supported operations:**

- Onboard a new team (GCP folder hierarchy, Identity groups, GitHub teams, Datadog team)
- Add or remove members (GitHub teams, Datadog team, GCP Identity groups)
- Add or remove GitHub repositories
- Add or remove GitHub deployment environments
- Enable or disable feature flags (`enable_workflows`, `enable_opentofu_state_management`, `enable_datadog_webhook`, `enable_datadog_secrets`, `enable_google_wif_service_account`)
- Add or remove GCP projects
- Add GKE cluster locations
- Open a GitHub issue on `pt-logos`
