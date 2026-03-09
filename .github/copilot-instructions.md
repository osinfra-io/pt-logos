# pt-logos

Creates the foundational organizational structure — GCP folder hierarchy, Google Identity groups, GitHub teams and repositories, and Datadog teams. All downstream layers (corpus, pneuma) depend on its outputs.

This repo is the source of truth consumed by `module.helpers` — it does not invoke a helpers module itself.

## Structure

- `teams/` — per-team tfvars files (e.g. `pt-corpus.tfvars`, `pt-pneuma.tfvars`) define each team's resources

## Workspace Naming

`pt-logos-main-{env}` (e.g. `pt-logos-main-production`)
