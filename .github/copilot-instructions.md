# Logos Infrastructure as Code - AI Coding Guide

## Project Overview
This OpenTofu project establishes foundational platform order (**Logos**) across Google Cloud, GitHub, and Datadog using **Team Topologies** methodology. It creates hierarchical organizational structures with consistent security, governance, and operational practices that enable team autonomy.

## Architecture & Core Concepts

### Team Topologies Structure
The project implements a 3-level Google Cloud folder hierarchy:
```
Top Level Folder → Team Type Folders → Team Folders → Environment Folders
                   (Platform Teams)    (Logos/Pneuma)  (Sandbox/Non-Production/Production)
```

### Key Components Created
- **Google Cloud**: Folder hierarchy + Identity Groups (admin/writer/reader roles) + IAM bindings + Billing budgets
- **GitHub**: Parent teams + 4 child teams per team (sandbox/non-prod/prod approvers + repo admins) + Repositories with branch protection and webhooks
- **Datadog**: Teams with admin/member roles + User management

## Repository Structure
- `main.tofu` - All resource definitions, organized with data sources first, then resources alphabetically by resource type
- `locals.tofu` - Complex data transformations from team configs to flat resource maps (alphabetically ordered)
- `variables.tofu` - Strongly typed team configuration with validation rules (alphabetically ordered)
- `outputs.tofu` - Output values (alphabetically ordered)
- `providers.tofu` - Provider configurations and version constraints
- `backend.tofu` - Remote state backend configuration
- `teams/` - Per-team configuration files following `{team_prefix}-{team_name}.tfvars` pattern
- `.github/` - CI/CD workflows and repository automation

### File Organization & Structure Standards
- **File structure**: All variables, outputs, locals, and tfvars must be in strict alphabetical order
- **main.tofu structure**: Data sources first, then resources alphabetically by resource type
- **Resource arguments**: All arguments within a resource must be in strict alphabetical order
- **Meta-argument priority**: Any meta-arguments (for_each, count, depends_on, lifecycle, provider, and any argument that controls resource behavior rather than configuring the resource itself) must always be the first argument in a resource or data source if required. Multiple meta-arguments should be ordered alphabetically among themselves. Note: lifecycle blocks are meta-arguments and must be positioned before all regular resource configuration arguments
- **Resource arguments**: All remaining arguments within a resource must be in strict alphabetical order, regardless of whether they're required or optional
- **Nested block ordering**: Within nested blocks (lifecycle, provisioner, etc.), use normal alphabetical ordering
- **List/Map formatting**: Always have an empty newline before any list or map or any logic unless it's the first argument. Always have an empty newline after any list or map or any logic unless it's the last argument.
- **Function formatting**: All function calls should use single-line formatting for better readability and consistency.
- **Meta-argument ordering example**:
  ```hcl
  resource "example_resource" "this" {
    for_each = local.example_map

    depends_on = [
      other_resource.this
    ]

    lifecycle {
      prevent_destroy = true
    }

    # Regular arguments in alphabetical order
    argument_a = "value"
    argument_b = "value"
  }
  ```
- **Consistent ordering**: Maintains readability and makes code easier to navigate
- **Configuration separation**: Team-specific configs isolated in `teams/` directory
- **Infrastructure separation**: Backend and provider configs separated for clarity

## Development Workflows

### Team Configuration Pattern
Teams are defined in `teams/{team-prefix}-{team-name}.tfvars` following this structure:
```hcl
team = {
  team_key = {
    display_name = "Title Case Name"  # Must pass validation regex
    team_type    = "platform-team"    # One of 4 Team Topologies types

    # Hardcoded structures with customizable membership:
    github_parent_team = { maintainers = [], members = [] }
    github_child_teams = {
      sandbox-approver = { maintainers = [], members = [] }
      # ... 3 more hardcoded child teams
    }
    google_identity_groups = {
      admin = { managers = [], members = [], owners = [] }
      # ... writer, reader (3 hardcoded roles)
    }
    datadog_team = { admins = [], members = [] }
    repositories = {
      repo_name = {
        description = "Repository description"
        topics = ["topic1", "topic2"]
        push_allowances = ["org/team"]
        enable_discord_webhook = true
        enable_datadog_webhook = true
      }
    }
  }
}
```

### Validation & Deployment
- **Pre-commit hooks**: `tofu-fmt`, `tofu-validate` (see `.pre-commit-config.yaml`)
- **CI/CD**: Matrix deployment per team via `production.yml` workflow using reusable workflows
- **State management**: Per-team workspaces with GCS backend + KMS encryption

### Admin Protection Pattern
Organization owners/admins are **hardcoded in `locals.tofu`** and protected via lifecycle rules:
```hcl
# In locals.tofu
github_organization_owners = ["brettcurtis"]
datadog_organization_admins = ["brett@osinfra.io"]

# In main.tofu resources
lifecycle {
  prevent_destroy = true
  ignore_changes  = [role] # Prevent accidental demotion
}
```

## Code Standards

### Required Before Each Commit
- Run `tofu fmt` to format all OpenTofu configuration files
- Run `tofu validate` to validate configuration syntax and logic
- Execute `pre-commit run --all-files` to run all configured hooks
- Verify alphabetical ordering is maintained in all configuration files

### Development Flow
- **Format**: `tofu fmt -recursive`
- **Validate**: `tofu validate`
- **Plan**: `tofu plan -var-file=teams/{team}.tfvars`
- **Pre-commit**: `pre-commit run --all-files`
- **Full validation**: Run all pre-commit hooks before pushing changes

## Development Guidelines

### Adding New Teams
1. Create new `.tfvars` file in `teams/` directory using naming convention `{team_prefix}-{team_name}.tfvars`
2. Add team to GitHub workflow matrix in `.github/workflows/production.yml`
3. Team type must be one of: `platform-team`, `stream-aligned-team`, `complicated-subsystem-team`, `enabling-team`
4. Validate configuration with `tofu plan` before committing
5. Ensure all team members follow email normalization patterns

### Local Development Setup
```bash
# Speed up local validation with plugin cache
mkdir -p $HOME/.opentofu.d/plugin-cache
export TF_PLUGIN_CACHE_DIR=$HOME/.opentofu.d/plugin-cache

# Install pre-commit hooks
pre-commit install

# Run pre-commit hooks locally
pre-commit run --all-files
```

### Understanding Data Transformations
The `locals.tofu` file contains complex flattening operations that transform nested team configs into flat resource maps. Key patterns:
- **Flattening loops**: `flatten([for team_key, team in var.team : [...]])`
- **Deduplication**: `setsubtract()`, `distinct()` for handling overlapping memberships
- **Key generation**: Consistent naming like `"${team_key}-${role}"` for resource identification
- **Dynamic descriptions**: Generated from keys using string functions (e.g., `title(replace(key, "-", " "))`) rather than static mappings

### Naming Conventions
- **Team prefixes**: `pt-` (platform), `st-` (stream-aligned), `cst-` (complicated-subsystem), `et-` (enabling)
- **Google Groups**: `{team_prefix}-{team_key}-{role}@{domain}`
- **GitHub Teams**: Parent `{team_prefix}-{team_key}`, Children `{parent}-{function}`
- **Folders**: Title case display names from team configuration

### Testing Changes
- Use `tofu plan -var-file=teams/{team}.tfvars` to test specific team configurations
- Check `locals.tofu` outputs for proper data transformation
- Validate against existing state before applying changes to production
- Run `tofu validate` after any configuration changes
- Test with multiple team configurations to ensure no conflicts
- Verify resource naming conventions follow established patterns
- Use `tofu plan` with different variable files to test edge cases

### Resource Name Normalization
All resource keys containing user identifiers (email addresses) are normalized for ease of use, readability, and administration:
- **Normalization rules**: `@` → `-at-`, `.` → `-` (e.g., `brett@osinfra.io` → `brett-at-osinfra-io`)
- **Implementation**: Use helper locals (`normalize_email`, `datadog_user_names`) to centralize logic
- **Scope**: Applied to all resource keys that use email addresses (Datadog users, team memberships, Google identity group memberships)
- **Preservation**: Original email values are preserved in resource properties, only keys are normalized
- **Pattern**: Create normalized mappings in `locals.tofu`, reference via helper functions in `main.tofu`

**Example Implementation:**
```hcl
# In locals.tofu
normalize_email = {
  for email in local.all_datadog_users :
  email => replace(replace(email, "@", "-at-"), ".", "-")
}

# In main.tofu
resource "datadog_user" "this" {
  for_each = local.datadog_regular_users
  email = each.value  # Original email preserved
  # Resource key is normalized via the mapping
}
```

## Key Guidelines
1. Follow OpenTofu/Terraform best practices and idiomatic patterns
2. Maintain existing code structure and alphabetical organization
3. Use consistent data transformation patterns in `locals.tofu`
4. Prefer dynamic description/name generation over static mappings (DRY principle)
5. Write validation rules for new team configuration options
6. Document complex logic and architectural decisions in comments
7. Test configuration changes with multiple team scenarios
8. Follow Team Topologies methodology for organizational design
9. Preserve admin protection patterns for critical resources

## Common Patterns & Anti-Patterns
✅ **Do**: Use hardcoded admin lists in `locals.tofu` for protected users
✅ **Do**: Follow Team Topologies methodology for team classification
✅ **Do**: Use consistent key generation patterns in locals for resource mapping
✅ **Do**: Generate descriptions dynamically from keys using string functions
✅ **Do**: Maintain alphabetical ordering in all configuration files
✅ **Do**: Normalize resource keys containing email addresses using helper locals
✅ **Do**: Centralize normalization logic in `locals.tofu` rather than inline transformations
❌ **Don't**: Modify hardcoded structures (environments, roles, child team names)
❌ **Don't**: Remove admin protection without following 2-step removal process
❌ **Don't**: Skip validation rules - they enforce organizational standards
❌ **Don't**: Create static mappings when descriptions can be generated dynamically
❌ **Don't**: Use email addresses directly as resource keys without normalization
❌ **Don't**: Put normalization logic inline in resources - use helper locals instead
