# pt-logos

Creates the foundational organizational structure — GCP folder hierarchy, Google Identity groups, GitHub teams and repositories, and Datadog teams. All downstream layers (corpus, pneuma) depend on its outputs.

- `teams/` — per-team tfvars files (e.g. `pt-corpus.tfvars`, `pt-pneuma.tfvars`) define each team's resources
- This repo is the source of truth consumed by `module.helpers` — it does not invoke a helpers module itself.

## Team Configuration Schema

`teams/example.tfvars` is the canonical schema reference for all team configuration options. **Any time a field is added, removed, or changed in `variables.tofu`, `teams/example.tfvars` must be updated to match** — including the field itself, its comment explaining purpose and valid values, and whether it is required or optional.

## Issue Templates

`.github/ISSUE_TEMPLATE/team-onboarding.yml` is the onboarding issue form for new teams. It mirrors every field in `teams/example.tfvars` and is designed to produce output that Copilot can turn directly into a valid `teams/{team-key}.tfvars` file.

**Any time a field is added, removed, or changed in `variables.tofu` or `teams/example.tfvars`, the issue template must also be updated** — including the field label, description, placeholder, whether it is required or optional, and any inline guidance about when and why a team would use that field.

When a team-onboarding issue is submitted, three files must be created or updated as a single pull request:

1. **Create `teams/{team-key}.tfvars`** — Generate from the issue answers. All list-type answers (one item per line) convert to HCL list syntax. All YAML blocks in the repository, GKE, project, and corpus group fields convert to equivalent HCL structure.

2. **Add the team to `.github/workflows/production.yml`** — Insert the team key into the `jobs.main.strategy.matrix.team` list in alphabetical order.

3. **Add a GitHub environment to `teams/pt-logos.tfvars`** — Inside `github_repositories["pt-logos"].environments`, add a new entry following the existing pattern. The environment key is the team key with its prefix stripped, suffixed with `-production` (e.g., `pt-myteam` → `myteam-production`; `st-myproduct` → `myproduct-production`):
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

## GitHub Actions

Logos deploys only to production — on push to `main` and via `workflow_dispatch`. Each team's tfvars file is applied as a separate matrix job (e.g. `pt-corpus`, `pt-pneuma`).
