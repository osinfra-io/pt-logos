## Team Configuration Schema

`teams/example.tfvars` is the canonical schema reference for all team configuration options. **Any time a field is added, removed, or changed in `variables.tofu`, `teams/example.tfvars` must be updated to match** — including the field itself, its comment explaining purpose and valid values, and whether it is required or optional.


Creates the foundational organizational structure — GCP folder hierarchy, Google Identity groups, GitHub teams and repositories, and Datadog teams. All downstream layers (corpus, pneuma) depend on its outputs.

This repo is the source of truth consumed by `module.helpers` — it does not invoke a helpers module itself.

## Structure

- `teams/` — per-team tfvars files (e.g. `pt-corpus.tfvars`, `pt-pneuma.tfvars`) define each team's resources

## Workspace Naming

`pt-logos-main-{env}` (e.g. `pt-logos-main-production`)
