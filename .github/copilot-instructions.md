# pt-logos

Creates the foundational organizational structure — GCP folder hierarchy, Google Identity groups, GitHub teams and repositories, and Datadog teams. All downstream layers (corpus, pneuma) depend on its outputs.

- `teams/` — per-team tfvars files (e.g. `pt-corpus.tfvars`, `pt-pneuma.tfvars`) define each team's resources
- This repo is the source of truth consumed by `module.helpers` — it does not invoke a helpers module itself.

## Team Configuration Schema

`teams/example.tfvars` is the canonical schema reference for all team configuration options. **Any time a field is added, removed, or changed in `variables.tofu`, `teams/example.tfvars` must be updated to match** — including the field itself, its comment explaining purpose and valid values, and whether it is required or optional.

## Nomos Agent

[`pt-techne-agents`](https://github.com/osinfra-io/pt-techne-agents) hosts the [Nomos Agent](https://github.com/osinfra-io/pt-techne-agents/blob/main/.github/agents/techne-nomos.agent.md) — the platform's self-serve interface for all teams. It detects intent from natural language, guides the user through the appropriate flow, and opens a pull request with every change.

**Any time a field is added, removed, or changed in `variables.tofu` or `teams/example.tfvars`, the Nomos Agent prompt must also be reviewed and updated** to reflect the change in its conversation flow, validation rules, and generated HCL.

When onboarding a team, the agent opens **two pull requests in sequence** — the GitHub environment must exist before the second PR's deployment can be gated by it:

**PR 1 — Create the GitHub environment** (branch `onboard/{team-key}-environment`):

1. **Add a GitHub environment to `teams/pt-logos.tfvars`** — Inside `github_repositories["pt-logos"].environments`, add a new entry. The environment key is the team key with its type prefix stripped, suffixed with `-production` (e.g., `pt-myteam` → `myteam-production`; `st-myproduct` → `myproduct-production`):
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

**PR 2 — Onboard the team** (branch `onboard/{team-key}`):

1. **Create `teams/{team-key}.tfvars`** — Valid HCL generated from collected answers, matching the style of existing tfvars files.

2. **Add the team to `.github/workflows/production.yml`** — Insert the team key into `jobs.main.strategy.matrix.teams` in alphabetical order.

PR 1 must be merged first so the `{team-key-without-prefix}-production` GitHub environment exists to gate the workflow that fires when PR 2 merges.

All other operations open a PR against only the relevant `teams/{team-key}.tfvars` file.

## GitHub Actions

Logos deploys only to production — on push to `main` and via `workflow_dispatch`. Each team's tfvars file is applied as a separate matrix job (e.g. `pt-corpus`, `pt-pneuma`).
