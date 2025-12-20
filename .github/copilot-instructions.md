# pt-logos Repository - Copilot Agent Onboarding Guide

## Repository Summary
**Type**: Infrastructure as Code (OpenTofu/Terraform)
**Purpose**: Foundational platform layer establishing organizational hierarchy, access controls, and team structures across Google Cloud, GitHub, and Datadog using Team Topologies methodology
**Size**: ~20 files, ~500 lines of OpenTofu configuration
**Language**: HCL (HashiCorp Configuration Language)
**Runtime**: OpenTofu v1.10.7+
**Providers**: Google Cloud (v7.9.0), GitHub (v6.7.5), Datadog (v3.78.0)

## Critical Build & Validation Commands

**ALWAYS run these commands in this exact order before committing:**

```bash
# 1. Install pre-commit hooks (first time only)
pre-commit install

# 2. Run all validation checks (REQUIRED before every commit)
cd /home/brett/Repositories/osinfra-io/pt-logos
pre-commit run -a
```

**Expected output**: All hooks should pass with "Passed" status. The hooks run:
- `check-yaml` - Validates YAML syntax
- `end-of-file-fixer` - Ensures files end with newline
- `trailing-whitespace` - Removes trailing whitespace
- `check-symlinks` - Validates symbolic links
- `tofu-fmt` - Formats OpenTofu files (auto-fixes)
- `tofu-validate` - Validates OpenTofu configuration

**Common Issues**:
- If `tofu-validate` fails with "Error: No valid credential sources found", this is expected for local development without GCP credentials. The CI/CD pipeline has proper credentials.
- If `tofu-fmt` fails, it will auto-fix formatting. Run `pre-commit run -a` again to verify.

**Plugin Cache Optimization** (speeds up local validation):
```bash
mkdir -p $HOME/.opentofu.d/plugin-cache
export TF_PLUGIN_CACHE_DIR=$HOME/.opentofu.d/plugin-cache
```

## Repository Structure

**Core OpenTofu Files** (root directory):
- `main.tofu` - All resource definitions, alphabetically by resource type
- `data.tofu` - All data source definitions
- `locals.tofu` - Complex data transformations (team configs → flat resource maps)
- `variables.tofu` - Input variables with validation rules (alphabetically ordered)
- `outputs.tofu` - Output values (alphabetically ordered)
- `providers.tofu` - Provider configurations (Google, GitHub, Datadog)
- `backend.tofu` - GCS backend with KMS encryption

**Configuration & Teams**:
- `teams/*.tfvars` - Per-team configuration files (pattern: `{team_prefix}-{team_name}.tfvars`)
  - `pt-logos.tfvars` - Platform team: Logos
  - `pt-corpus.tfvars` - Platform team: Corpus
  - `pt-pneuma.tfvars` - Platform team: Pneuma
  - `st-ethos.tfvars` - Stream-aligned team: Ethos

**CI/CD & Automation**:
- `.github/workflows/production.yml` - Matrix deployment (one job per team)
- `.github/workflows/dependabot.yml` - Dependency updates
- `.pre-commit-config.yaml` - Pre-commit hook configuration

**Documentation**:
- `README.md` - Comprehensive project documentation
- `.github/copilot-instructions.md` - This file

## Architecture Overview

**3-Level Folder Hierarchy**:
```
Team Type Folders (pre-created) → Team Folders → Environment Folders
   Platform Teams                    Logos         Sandbox/Non-Production/Production
   Stream-aligned Teams              Ethos         Sandbox/Non-Production/Production
```

**Resources Created Per Team**:
- Google Cloud: Team/environment folders, 3 identity groups (admin/writer/reader), IAM bindings, billing budgets
- GitHub: Parent team + 4 child teams (sandbox/non-prod/prod approvers + repo admins), repositories with branch protection
- Datadog: Team with admin/member roles, user management

**Organization-Level Resources (logos workspace only)**:
- Datadog: Log indexes with retention policies and exclusion filters, organization settings (SAML, widget sharing)
- GitHub: Organization settings, actions permissions
- Google Cloud: Billing account IAM, organization-wide identity groups

**Critical Workspace Pattern**:
- `pt-logos-main-production` workspace: Creates organization-level admin/owner resources
- Other team workspaces: Reference admins via data sources to prevent conflicts
- Controlled by `local.within_logos = terraform.workspace == "pt-logos-main-production"`

## Code Standards (CRITICAL)

### File Structure
- **All configuration files**: Variables, outputs, locals, and tfvars MUST be in strict alphabetical order
- **main.tofu structure**: Resources organized alphabetically by resource type (data sources in separate `data.tofu`)
- **Universal alphabetical ordering**: ALL arguments, keys, and properties at EVERY level of configuration must be alphabetically ordered (applies to variables, outputs, locals, resources, data sources, and nested blocks)

### Alphabetical Ordering with Logical Grouping Exception
Limited exception to strict alphabetical ordering allowed ONLY for team membership variables:

1. **Team membership variables only**: Variables ending in `_memberships` that configure team/group membership (e.g., `github_parent_team_memberships`, `github_child_teams_memberships`, `google_identity_groups_memberships`)
2. **Grouping rationale**: Team membership structures are logically grouped to maintain clarity of role hierarchies and team relationships
3. **Alphabetical within groups**: Alphabetical ordering still applies within each grouped block

**Example of valid logical grouping**:
```hcl
# Team membership variables (grouped by purpose)
github_parent_team_memberships = { maintainers = [], members = [] }

# GitHub child team memberships (nested map structure grouped by purpose)
github_child_teams_memberships = {
  non-production-approvers = { maintainers = [], members = [] }
  production-approvers = { maintainers = [], members = [] }
  repository-administrators = { maintainers = [], members = [] }
  sandbox-approvers = { maintainers = [], members = [] }
}

google_identity_groups_memberships = { ... }

# Other variables follow strict alphabetical order
display_name = "..."
team_type = "..."
```

### Meta-Arguments Priority
Meta-arguments (`for_each`, `count`, `depends_on`, `lifecycle`, `provider`) MUST be the first arguments in resources/data sources when required:

- **Position**: Always first, before all regular resource configuration arguments
- **Multiple meta-arguments**: Ordered alphabetically among themselves
- **lifecycle blocks**: Are meta-arguments and must be positioned before all regular resource configuration arguments
- **Nested block ordering**: Within nested blocks (lifecycle, provisioner, etc.), use normal alphabetical ordering

**Example**:
```hcl
resource "example_resource" "this" {
  for_each = local.example_map

  depends_on = [other_resource.this]

  lifecycle {
    ignore_changes  = [role]
    prevent_destroy = true
  }

  # Regular arguments in strict alphabetical order
  argument_a = "value"
  argument_b = "value"
  description = "example"
}
```

### Resource Arguments
- **All remaining arguments**: Must be in strict alphabetical order after meta-arguments, regardless of whether they're required or optional
- **No exceptions**: Alphabetical ordering applies to all standard resource arguments

### Formatting Rules
- **List/Map formatting**: Always have an empty newline before any list, map, or logic block unless it's the first argument. Always have an empty newline after any list, map, or logic block unless it's the last argument.
- **Function formatting**: Use single-line formatting for simple function calls. For complex functions with long lines or multiple arguments, break into multiple lines for readability. Prioritize readability over strict single-line requirements.

**Function formatting examples**:
```hcl
# Simple function - single line
name = upper(var.environment)

# Complex function - multiple lines for readability
user_id = try(
  datadog_user.admins[local.normalize_email[each.value.user_id]].id,
  datadog_user.this[local.normalize_email[each.value.user_id]].id
)
```

## Admin Protection Pattern (DO NOT BREAK)

**Organization owners/admins are hardcoded in `locals.tofu`**:
```hcl
github_organization_owners = ["brettcurtis"]
datadog_organization_admins = ["brett@osinfra.io"]
within_logos = terraform.workspace == "pt-logos-main-production"
```

**Organization-level settings are hardcoded in `locals.tofu`**:
- `log_indexes` - Datadog log index configurations with retention, limits, and exclusion filters
- Organization settings managed only in `pt-logos-main-production` workspace

**Resources have lifecycle protection**:
```hcl
resource "github_membership" "owners" {
  for_each = local.within_logos ? toset(local.github_organization_owners) : toset([])

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [role]
  }
  # ...
}
```

**NEVER remove `prevent_destroy` or modify admin hardcoded lists without explicit user approval.**

## Team Configuration Pattern

Teams are defined in `teams/{team-prefix}-{team-name}.tfvars`:
- `team_type`: One of `platform-team`, `stream-aligned-team`, `complicated-subsystem-team`, `enabling-team`
- `display_name`: Title Case (validated by regex)
- Hardcoded structures: 3 environments, 3 Google identity groups, 4 GitHub child teams
- Customizable: Membership lists for all teams/groups

**Team prefixes**: `pt-` (platform), `st-` (stream-aligned), `cst-` (complicated-subsystem), `et-` (enabling)

## Adding New Teams (Step-by-Step)

1. Create `teams/{team_prefix}-{team_name}.tfvars` with team configuration
2. Add team to matrix in `.github/workflows/production.yml`
3. Run `pre-commit run -a` to validate
4. Commit to main branch
5. GitHub Actions automatically deploys team infrastructure

## Email Normalization Pattern

Email addresses in resource keys are normalized: `@` → `-at-`, `.` → `-`
Example: `brett@osinfra.io` → `brett-at-osinfra-io`

**Implementation in `locals.tofu`**:
```hcl
normalize_email = {
  for email in local.all_datadog_users :
  email => replace(replace(email, "@", "-at-"), ".", "-")
}
```

Original email values are preserved in resource properties; only keys are normalized.

## Data Transformation Patterns

`locals.tofu` uses complex flattening to transform nested team configs into flat resource maps:
- `flatten([for team_key, team in var.team : [...]])` - Nested loop flattening
- `setsubtract()`, `distinct()` - Deduplication of overlapping memberships
- `"${team_key}-${role}"` - Consistent key generation
- `title(replace(key, "-", " "))` - Dynamic description generation (DRY principle)

## CI/CD Pipeline

**Workflow**: `.github/workflows/production.yml`
**Trigger**: Push to `main` branch (ignores `**.md` changes)
**Strategy**: Matrix deployment (one job per team: pt-logos, pt-corpus, pt-pneuma, st-ethos)
**Backend**: GCS bucket `pt-logos-state-prod` with KMS encryption
**Workspace**: `{team}-main-production` (e.g., `pt-logos-main-production`)

**Service Account**: `pt-logos-github@pt-corpus-tf16-prod.iam.gserviceaccount.com` (requires Groups Admin role in Google Workspace)

## Key Guidelines

✅ **Do**:
- Follow alphabetical ordering rigorously
- Use `pre-commit run -a` before every commit
- Preserve admin protection patterns
- Generate descriptions dynamically (not static mappings)
- Normalize email addresses in resource keys
- Document complex logic with comments

❌ **Don't**:
- Modify hardcoded structures (environments, roles, child team names, log indexes)
- Remove admin protection without explicit approval
- Skip validation rules
- Use email addresses directly as resource keys
- Create static mappings when descriptions can be generated
- Parameterize organization-wide settings (keep in locals.tofu)

## Trust These Instructions

These instructions have been validated against the current codebase. Only perform additional searches if information is incomplete or found to be in error. The pre-commit hooks will catch most errors automatically.
