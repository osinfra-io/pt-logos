# pt-logos

Creates the foundational organizational structure — GCP folder hierarchy, Google Identity groups, GitHub teams and repositories, and Datadog teams. All downstream layers (corpus, pneuma) depend on its outputs.

- `teams/` — per-team tfvars files (e.g. `pt-corpus.tfvars`, `pt-pneuma.tfvars`) define each team's resources
- This repo is the source of truth consumed by `module.helpers` — it does not invoke a helpers module itself.

The `pt-logos-global` workspace uses `teams = {}` and exclusively owns the organization-wide Google billing-users, state-readers, and GKE security groups, exposed through `organization_groups`. Each environment's `pt-logos` foundation owns its environment root, team-type folders, and Logos team resources; remaining team workspaces create their own team folders and groups. Only the Corpus team state owns the three environment-root access grants. GitHub and Datadog resources retain their existing Production owners. Existing organization groups must be migrated from their former state before the global owner is enabled; never create a second owner.

## Team Configuration Schema

The `teams` variable in `variables.tofu` is the canonical, in-repo schema for all team configuration options — its types, `optional()` defaults, and `validation` blocks define what every `teams/*.tfvars` file may contain. The schema is also documented on the [Team Topology](https://osinfra-io.github.io/docs/platform-grouping/logos/team-topology) docs page and enforced by `schema/team.schema.json` in [`pt-techne-mcp-server`](https://github.com/osinfra-io/pt-techne-mcp-server) (used by the `render_team_tfvars` tool to validate a spec before rendering a `.tfvars` file).

**Any time a field is added, removed, or changed in the `teams` variable in `variables.tofu`, all of the following must be updated to match:** the Team Topology docs page, `schema/team.schema.json` in `pt-techne-mcp-server`, and the Nomos Agent prompt (see below).

## Nomos Agent

[`pt-techne-agents`](https://github.com/osinfra-io/pt-techne-agents) hosts the [Nomos Agent](https://github.com/osinfra-io/pt-techne-agents/blob/main/.github/agents/nomos.agent.md) — the platform's self-serve interface for all teams. It detects intent from natural language, guides the user through the appropriate flow, and opens a pull request with every change.

**Any time a field is added, removed, or changed in the `teams` variable in `variables.tofu`, the Nomos Agent prompt must also be reviewed and updated** to reflect the change in its conversation flow, validation rules, and generated HCL.

When onboarding a team, the agent opens **two pull requests in sequence** — the GitHub environments must exist before the second PR adds the team to the deployment matrices:

**PR 1 — Create the GitHub environment** (branch `onboard/{team-key}-environment`):

1. **Add three GitHub environments to `teams/pt-logos.tfvars`** — Inside `github_repositories["pt-logos"].environments`, add Sandbox, Non-Production, and Production entries. Use the team key with its type prefix stripped and the environment as the suffix (e.g., `pt-myteam` → `myteam-sandbox`, `myteam-non-production`, `myteam-production`; `st-myproduct` → `myproduct-*`). The names and reviewers must match the corresponding workflow contexts:
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
   myteam-non-production = {
     name = "Non-Production: {team-key}"
     reviewers = {
       teams = ["pt-logos-non-production-approvers"]
     }
   }
   myteam-sandbox = {
     name = "Sandbox: {team-key}"
     reviewers = {
       teams = ["pt-logos-sandbox-approvers"]
     }
   }
   ```

**PR 2 — Onboard the team** (branch `onboard/{team-key}`):

1. **Create `teams/{team-key}.tfvars`** — Valid HCL generated from collected answers, matching the style of existing tfvars files.

2. **Add the team to the matrix in all three deployment workflows** — Insert the team key into `jobs.teams.strategy.matrix.teams` in `.github/workflows/sandbox.yml`, `.github/workflows/non-production.yml`, and `.github/workflows/production.yml` in alphabetical order.

PR 1 must be merged first so all three GitHub environments exist before the workflows in PR 2 reference them.

All other operations open a PR against only the relevant `teams/{team-key}.tfvars` file.

## GitHub Actions

Logos deploys through three environments. Sandbox runs on pull requests and via `workflow_dispatch`; Non-Production runs on pushes to `main` and via `workflow_dispatch`; Production runs after a successful Non-Production workflow on `main` and via `workflow_dispatch`. The `pt-logos` foundation workspace runs before the team matrix; each remaining team's tfvars file is applied as a separate matrix job (e.g. `pt-corpus`, `pt-pneuma`).
