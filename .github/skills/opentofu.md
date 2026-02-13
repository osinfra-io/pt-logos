# OpenTofu

Specialized guidance for OpenTofu (Terraform) infrastructure-as-code workflows.

## File Structure & Organization

### Standard Files

- `main.tofu` - Resource and module declarations
- `data.tofu` - Data source definitions
- `locals.tofu` - Complex data transformations
- `variables.tofu` - Input variables with validation
- `outputs.tofu` - Output values
- `providers.tofu` - Provider configurations
- `backend.tofu` - State storage configuration
- `helpers.tofu` - Helper module integration (when applicable)

### Alphabetical Ordering Rules

- **Variables, outputs, locals, tfvars**: Strict alphabetical order
- **Resources/data sources**: Alphabetically by resource type
- **All arguments**: Alphabetically ordered at every nesting level
- **Meta-arguments first**: `count`, `depends_on`, `for_each`, `lifecycle`, `provider` (alphabetically among themselves)
- **Exception**: Logical grouping allowed only for team membership variables with comment annotation

### Formatting

- **Lists/Maps**: Empty newline before and after (unless first/last argument)
- **Functions**: Single-line for simple calls; multi-line for complex nested functions
- **Indentation**: 2 spaces (enforced by `tofu fmt`)

## Resource Patterns

### Meta-Arguments Priority

```hcl
resource "google_service_account" "example" {
  depends_on = [google_project_service.apis]
  for_each = local.accounts
  account_id = each.key
  display_name = each.value.name
  project = var.project_id
}
```

### Lifecycle Protection

- Always use `prevent_destroy = true` for critical infrastructure (KMS keys, state buckets, admin accounts)
- Use `ignore_changes` for externally managed fields

```hcl
lifecycle {
  ignore_changes = [role]
  prevent_destroy = true
}
```

### Conditional Resource Creation

**OpenTofu v1.11+ introduced the `enabled` meta-argument for cleaner conditional resource creation.**

**Prefer `enabled` over `count` for conditional resources:**

```hcl
# Modern approach (OpenTofu v1.11+)
resource "example" "conditional" {
  lifecycle {
    enabled = local.should_create
  }

  # Access directly without [0] indexing
  name = "example"
}

# Legacy approach (avoid)
resource "example" "conditional" {
  count = local.should_create ? 1 : 0

  # Requires array indexing [0]
  name = "example"
}
```

**Benefits of `enabled`:**

- Direct resource access (no `[0]` indexing)
- Proper null state handling when disabled
- Cleaner syntax and intent
- Works with complex boolean conditions

**Common pattern for organization-level resources:**

```hcl
locals {
  within_logos = terraform.workspace == "pt-logos-main-production"
}

resource "google_billing_account_iam_member" "terraform" {
  lifecycle {
    enabled = local.within_logos && var.google_billing_account != null
  }

  billing_account_id = var.google_billing_account
  member = "serviceAccount:${data.google_service_account.terraform.email}"
  role = "roles/billing.user"
}
```

## Module Integration

### Module References

- Pin versions using git refs: `source = "github.com/org/repo//path?ref=v1.2.3"`
- Document version in comment: `# v1.2.3`
- Access outputs: `module.<name>.<output>`
- Never hardcode values available from modules

### Helpers Module Pattern

```hcl
module "helpers" {
  source = "github.com/osinfra-io/opentofu-core-helpers//root?ref=<version>"

  cost_center = "x001"
  data_classification = "public"
  logos_workspaces = ["<team>-main-production", "pt-logos-main-production"]
  repository = "<repo-name>"
  team = "<team-name>"
}
```

Provides:

- `module.helpers.labels` - Consistent resource labels
- `module.helpers.env` - Environment detection (sb/np/prod)
- `module.helpers.project_naming` - Standardized naming
- `module.helpers.environment_folder_id` - Folder hierarchy
- `module.helpers.teams` - Team data and configurations

## Data Transformations

### Flattening Nested Structures

```hcl
locals {
  flat_resources = flatten([
    for team_key, team in var.teams : [
      for role_key, members in team.roles : {
        key = "${team_key}-${role_key}"
        team = team_key
        role = role_key
        members = members
      }
    ]
  ])
}
```

### Email Normalization

```hcl
locals {
  normalize_email = {
    for email in local.all_emails :
    email => replace(replace(email, "@", "-at-"), ".", "-")
  }
}
```

### Deduplication

```hcl
locals {
  unique_members = distinct(flatten([
    for team in var.teams : team.members
  ]))

  non_overlapping = setsubtract(
    local.all_members,
    local.admin_members
  )
}
```

## Environment Management

### Workspace Pattern

- Workspace naming: `{team}-{component}-{environment}`
- Examples: `pt-logos-main-production`, `regional-sandbox`
- Backend: Encrypted GCS buckets with KMS
- Environment detection: `module.helpers.env` (sb/np/prod)

### Environment Progression

1. **Sandbox** (`sb`) - Development and testing
2. **Non-Production** (`np`) - Staging/UAT
3. **Production** (`prod`) - Live environment

### Conditional Resources

**For map-based resources:**

```hcl
locals {
  within_logos = terraform.workspace == "pt-logos-main-production"
}

resource "example" "org_level" {
  for_each = local.within_logos ? local.org_resources : {}
  # ...
}
```

**For single resources (OpenTofu v1.11+):**

```hcl
resource "example" "org_level" {
  lifecycle {
    enabled = local.within_logos
  }
  # ...
}
```

## Validation & Testing

### Pre-Commit Hooks

- `tofu fmt` - Auto-formats files
- `tofu validate` - Validates configuration syntax
- `check-yaml` - YAML syntax validation
- `trailing-whitespace` - Removes trailing whitespace
- `end-of-file-fixer` - Ensures files end with newline

### Plugin Cache (Performance)

```bash
mkdir -p $HOME/.opentofu.d/plugin-cache
export TF_PLUGIN_CACHE_DIR=$HOME/.opentofu.d/plugin-cache
```

## Repository-Specific Patterns

### pt-logos (Foundational/Organization Layer)

**Purpose:** Manages organization-wide foundational resources that all teams depend on.

**Unique Characteristics:**

- **Single workspace pattern:** `pt-logos-main-production` manages all team configurations
- **Team-based structure:** Uses `teams/` directory with per-team tfvars files (e.g., `pt-corpus.tfvars`, `pt-pneuma.tfvars`)
- **Organization-level resources:** Conditionally created using `local.within_logos` check
- **No helpers module:** This repository IS the source of truth that other teams consume
- **Foundational outputs:** Provides team data, identity groups, and organizational structure consumed downstream

**Key Patterns:**

```hcl
# Organization-level conditional resource creation
locals {
  within_logos = terraform.workspace == "pt-logos-main-production"
}

resource "github_organization_settings" "this" {
  lifecycle {
    enabled = local.within_logos
  }
  # ...
}

# Team structure transformation
locals {
  all_github_users = toset(concat(
    tolist(local.github_users),
    local.github_organization_owners
  ))
}
```

**Workflow:** Direct deployment to production on push to main (no multi-environment progression).

## References

- [OpenTofu Documentation](https://opentofu.org/docs/)
