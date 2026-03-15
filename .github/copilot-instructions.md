# pt-logos

Creates the foundational organizational structure — GCP folder hierarchy, Google Identity groups, GitHub teams and repositories, and Datadog teams. All downstream layers (corpus, pneuma) depend on its outputs.

- `teams/` — per-team tfvars files (e.g. `pt-corpus.tfvars`, `pt-pneuma.tfvars`) define each team's resources
- This repo is the source of truth consumed by `module.helpers` — it does not invoke a helpers module itself.

## Team Configuration Schema

`teams/example.tfvars` is the canonical schema reference for all team configuration options. **Any time a field is added, removed, or changed in `variables.tofu`, `teams/example.tfvars` must be updated to match** — including the field itself, its comment explaining purpose and valid values, and whether it is required or optional.

## Logos Operations Agent

`.github/agents/logos.agent.md` is the Copilot agent for managing all logos-owned resources. It detects intent from natural language, guides the user through the appropriate flow, and opens a pull request with every change.

Supported operations: onboard a new team, add or remove members (GitHub teams, Datadog team, GCP Identity groups), add or remove repositories, add or remove GitHub environments, enable or disable feature flags, add or remove GCP projects, add GKE cluster locations, and update a team's display name.

**Any time a field is added, removed, or changed in `variables.tofu` or `teams/example.tfvars`, the agent prompt must also be reviewed and updated** to reflect the change in its conversation flow, validation rules, and generated HCL.

When onboarding a team, the agent opens a single pull request with these three changes:

1. **Create `teams/{team-key}.tfvars`** — Valid HCL generated from collected answers, matching the style of existing tfvars files.

2. **Add the team to `.github/workflows/production.yml`** — Insert the team key into `jobs.main.strategy.matrix.team` in alphabetical order.

3. **Add a GitHub environment to `teams/pt-logos.tfvars`** — Inside `github_repositories["pt-logos"].environments`, add a new entry. The environment key is the team key with its type prefix stripped, suffixed with `-production` (e.g., `pt-myteam` → `myteam-production`; `st-myproduct` → `myproduct-production`):
   ```hcl
   myteam-production = {
     deployment_branch_policy = {
       custom_branch_policies = false
       protected_branches     = true
     }
     name = "Production: {team-key}"
     reviewers = {
       teams = ["pt-logos-production-approvers"]
     }
   }
   ```

All other operations open a PR against only the relevant `teams/{team-key}.tfvars` file.

## GitHub Actions

Logos deploys only to production — on push to `main` and via `workflow_dispatch`. Each team's tfvars file is applied as a separate matrix job (e.g. `pt-corpus`, `pt-pneuma`).
