# Logos

[![Copilot Agent](https://img.shields.io/badge/Copilot%20Agent-Enabled-6E40C9?style=for-the-badge&logo=githubcopilot&logoColor=white)](https://github.com/osinfra-io/pt-logos/tree/main/.github/agents) [![Dependabot](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-logos/dependabot.yml?style=for-the-badge&logo=github&color=2088FF&label=Dependabot)](https://github.com/osinfra-io/pt-logos/actions/workflows/dependabot.yml) [![Datadog Security Enabled](https://img.shields.io/badge/Datadog%20Security-Enabled-632CA6?style=for-the-badge&logo=datadog)](https://app.datadoghq.com/security/code-security/repositories?repository_id=pt-logos)

## 📄 Repository Description

This repository contains the Infrastructure as Code (IaC) that establishes the Logos layer — the platform’s primordial principle of order from which all other structure emerges. Using OpenTofu, it brings coherence across multiple cloud providers, setting the first boundaries that transform an undifferentiated technical landscape into a domain where disciplined creation is possible.

As the grounding stratum of the platform hierarchy, Logos encodes the organizational logic itself: the clear lines of access, the governance boundaries that restrain chaos, and the stable standards that enable higher-level systems to flourish. Through the lens of Team Topologies, this layer defines the hierarchy of responsibility and relationship, ensuring that each team inhabits a space conducive to productive action.

Logos is where the platform’s moral architecture begins — where order is spoken into being so that all subsequent layers may stand upon it.

### 🛠️ Tools

- [pre-commit](https://github.com/pre-commit/pre-commit)
- [osinfra-pre-commit-hooks](https://github.com/osinfra-io/pt-techne-pre-commit-hooks)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [datadog logs](https://docs.datadoghq.com/logs/)
- [datadog teams](https://docs.datadoghq.com/account_management/teams/)
- [github repositories](https://docs.github.com/en/repositories)
- [github teams](https://docs.github.com/en/organizations/organizing-members-into-teams/about-teams)
- [google billing budgets](https://cloud.google.com/billing/docs/how-to/budgets)
- [google cloud platform groups](https://cloud.google.com/identity/docs/groups)
- [google cloud platform iam](https://cloud.google.com/iam/docs/overview)
- [google cloud platform resource landing-zone](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-landing-zone)
- [team topologies](https://teamtopologies.com/)

## 🚀 Onboarding a New Team

Adding a new team to the platform requires three sequential pull requests across three repositories. The order is strict — each layer depends on the outputs of the one before it.

### Prerequisites

- Decide the team type and key prefix:
  - `pt-` — platform team
  - `st-` — stream-aligned team
  - `ct-` — complicated-subsystem team
  - `et-` — enabling team
- Have GCP billing access to assign projects to the correct billing account
- Have a GitHub organization admin available if the new team needs repositories created

### Step 1 — Logos: define the team

Add a new `.tfvars` file under `teams/` following the pattern of an existing team (e.g. `teams/pt-corpus.tfvars`). At minimum, set:

```hcl
teams = {
  <team-key> = {
    display_name  = "<Title Case Name>"
    team_type     = "<platform-team|stream-aligned-team|...>"

    github_repositories = { ... }
    github_teams        = { ... }
    gke_locations       = [...]
  }
}
```

Open a PR, merge it, and wait for the **sandbox → non-production → production** deployment pipeline to complete. This creates the GCP folders, Google Identity groups, GitHub teams, and Datadog team that all downstream layers consume.

### Step 2 — Corpus: provision projects and networking

In [`pt-corpus`](https://github.com/osinfra-io/pt-corpus), add the team's project and networking configuration. The new team key from Step 1 will now be available via `module.helpers.teams`.

Open a PR, merge, and wait for the full deployment pipeline.

### Step 3 — Pneuma: add namespaces and RBAC

In [`pt-pneuma`](https://github.com/osinfra-io/pt-pneuma), add the team's namespace configuration to `variables.tofu` (or the relevant onboarding tfvars) so GKE namespaces and RBAC are created for the team.

Open a PR, merge, and wait for the full deployment pipeline.

### Estimated effort

| Step | Repo | Typical time |
|---|---|---|
| 1 | pt-logos | 30–60 min (write tfvars + PR review + ~15 min pipeline) |
| 2 | pt-corpus | 30–45 min (config + ~20 min pipeline) |
| 3 | pt-pneuma | 15–30 min (namespace config + ~30 min pipeline) |
