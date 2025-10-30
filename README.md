# <img width="45" height="45" alt="opentofu" src="https://github.com/user-attachments/assets/e7b3623b-6357-442e-a559-6d1494218355" /> Logos

**[GitHub Actions](https://github.com/osinfra-io/logos/actions):**

[![Dependabot](https://github.com/osinfra-io/logos/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/logos/actions/workflows/dependabot.yml)

## 📄 Repository Description

This repository provides Infrastructure as Code (IaC) automation for establishing foundational platform order across multiple cloud providers using OpenTofu. As the **Logos** - the foundational principle of order - it implements Team Topologies principles to create a structured organizational hierarchy with appropriate access controls, governance boundaries, and stable standards.

The foundational infrastructure automates the creation of:

- **Google Cloud folder hierarchy** following Team Topologies (Platform Teams, Stream-aligned Teams, etc.)
- **Google Cloud Identity Groups** with role-based access (admin, writer, reader)
- **GitHub Teams** with hierarchical structure and environment-specific approval workflows
- **Datadog Teams** for monitoring and observability
- **User Management** with lifecycle protection for organization owners and admins
- **Foundational outputs** for downstream consumption

This establishes the foundational order and provides structured outputs that enable downstream repositories to deploy projects with proper folder placement, access controls, and governance. Teams can operate autonomously with consistent security practices across sandbox, non-production, and production environments while maintaining robust administrative protections.

## 🏭 Platform Information

- Documentation: [docs.osinfra.io](https://docs.osinfra.io/product-guides/google-cloud-platform/logos)
- Service Interfaces: [github.com](https://github.com/osinfra-io/logos/issues/new/choose)

## <img align="left" width="35" height="35" src="https://github.com/osinfra-io/github-organization-management/assets/1610100/39d6ae3b-ccc2-42db-92f1-276a5bc54e65"> Development

Our focus is on the core fundamental practice of platform engineering, Infrastructure as Code.

>Open Source Infrastructure (as Code) is a development model for infrastructure that focuses on open collaboration and applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down stream-aligned teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository, describing the tools used, the skills, and the knowledge required, along with OpenTofu documentation.

See the [documentation](https://docs.osinfra.io/fundamentals/development-setup) for setting up a development environment.

### 🛠️ Tools

- [pre-commit](https://github.com/pre-commit/pre-commit)
- [osinfra-pre-commit-hooks](https://github.com/osinfra-io/pre-commit-hooks)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [google cloud platform groups](https://cloud.google.com/identity/docs/groups)
- [google cloud platform iam](https://cloud.google.com/iam/docs/overview)
- [google cloud platform resource landing-zone](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-landing-zone)
- [team topologies](https://teamtopologies.com/) - Organizational design methodology
- [github teams](https://docs.github.com/en/organizations/organizing-members-into-teams/about-teams)
- [datadog teams](https://docs.datadoghq.com/account_management/teams/)

## Architecture

The module creates a three-level Google Cloud Platform folder hierarchy following Team Topologies principles:

```text
Top Level Folder (provided)
├── Platform Teams/
│   ├── Logos/
│   │   ├── Sandbox/
│   │   ├── Non-Production/
│   │   └── Production/
│   └── Pneuma/
│       ├── Sandbox/
│       ├── Non-Production/
│       └── Production/
└── Stream-aligned Teams/
    └── Ethos/
        ├── Sandbox/
        ├── Non-Production/
        └── Production/
```

Additionally, it creates:

- **Google Cloud Identity Groups** with 3 standard roles per team (admin, writer, reader) applied at team folder level
- **GitHub Teams** with hierarchical structure (parent team with child teams for GitHub Actions approvers and repository administrators)
- **GitHub Users** with organization membership management and admin protection
- **Datadog Teams** for monitoring and observability with admin/member roles, one per top-level team
- **Datadog Users** with role-based access and admin protection

## Interface (tfvars)

### Required Variables

#### `team`

A map of teams with their team type and membership configuration for hardcoded structures.

```hcl
team = {
  logos = {
    display_name = "Logos"
    team_type    = "platform-team"

    github_parent_team = {
      maintainers = ["brettcurtis"]
      members     = []
    }

    github_child_teams = {
      sandbox-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      non-production-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      production-approver = {
        maintainers = ["brettcurtis"]
        members     = []
      }
      repository-administrators = {
        maintainers = ["brettcurtis"]
        members     = []
      }
    }

    datadog_team = {
      admins  = ["brett@osinfra.io"]
      members = []
    }

    google_identity_groups = {
      admin = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      writer = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
      reader = {
        managers = []
        members  = []
        owners   = ["brett@osinfra.io"]
      }
    }
  }
}
```

## Team Structure

### Team Types (Team Topologies)

Each team must specify one of four team types:

- **`platform-team`** - Provides internal services to accelerate stream-aligned teams
- **`stream-aligned-team`** - Aligned to business capabilities/customer value streams
- **`complicated-subsystem-team`** - Focus on specific technical domains requiring deep expertise
- **`enabling-team`** - Help stream-aligned teams overcome obstacles and develop capabilities

### Environments

Each team automatically gets three hardcoded environment folders:

- **Hardcoded environments**: `Sandbox`, `Non-Production`, `Production`

### Google Identity Groups

Each team has exactly 3 Google Cloud identity groups using basic IAM roles applied at the team folder level:

- **Hardcoded basic IAM roles**: reader, writer, admin
  - reader: Permissions for read-only actions that don't affect state, such as viewing (but not modifying) existing resources or data.
  - writer: All of the permissions in the Reader role, plus permissions for actions that modify state, such as changing existing resources.
  - admin: All of the permissions in the Writer role, plus permissions for actions like the following: Completing sensitive tasks, like managing tag bindings for Compute Engine resources; Managing roles and permissions for a project and all resources within the project; Setting up billing for a project.

Users can be assigned to one of three roles within each group:

- **`managers`**: Users who can manage the group
- **`members`**: Regular members of the group
- **`owners`**: Users who own the group
- **Hardcoded roles**: admin, writer, reader (automatically assigned)

**Auto-generated fields:**

- **`description`**: Uses official Google Cloud role descriptions (e.g., "All of the permissions in the Writer role, plus permissions for actions like...")
- **`display_name`**: `"{Team Type}: {Team Name} {Role}"` (e.g., "Platform Team: Logos Admin")

**Access Scope**: Groups have access to the entire team folder and all child environment folders.

### GitHub Team Structure

Each team has a hierarchical GitHub team structure with parent and child teams:

**Parent Team Configuration (`github_parent_team`):**

- **`maintainers`**: Users with full administrative access to the parent team
- **`members`**: Users with member access to the parent team

**Child Team Configuration (`github_child_teams`):**

- **`sandbox-approver`**: Members who can approve sandbox environment changes
- **`non-production-approver`**: Members who can approve Non-Production environment changes
- **`production-approver`**: Members who can approve production environment changes
- **`repository-administrators`**: Repository administrators with full access

**Membership Logic:**

- **Parent Team**: Gets configured maintainers/members PLUS child team maintainers (auto-inherited as members)
- **Child Teams**: Independently configured maintainers and members
- **Deduplication**: Users configured directly on parent team take precedence over auto-inherited membership

### Datadog Teams

- **Teams**: One per top-level team for monitoring and observability
- **Name format**: `"{Team Type}: {Team Name}"` (e.g., "Platform Team: Logos")
- **Description format**: `"{Team Name} is a {Team Type} {Team Topologies description}."` (e.g., "Logos is a Platform Team providing a compelling internal product to accelerate delivery by Stream-aligned teams.")
- **Handle format**: `{team_prefix}-{team_name}` (e.g., "pt-logos")

### User Management & Admin Protection

**Organization Owners/Admins:**

- **GitHub**: Hardcoded organization owners in `locals.tofu` get admin role and lifecycle protection
- **Datadog**: Hardcoded organization admins in `locals.tofu` get admin role and lifecycle protection
- **Protection**: Admin users cannot be destroyed via `tofu destroy` due to `prevent_destroy = true` lifecycle rules
- **Role Protection**: Admin roles cannot be accidentally changed via `ignore_changes` lifecycle rules

**Regular Users:**

- **GitHub**: Team members get standard member role and can be managed normally
- **Datadog**: Team members get read-only role by default, but can be assigned standard role via hardcoded list in `locals.tofu`
- **Management**: Can be added/removed through normal Infrastructure as Code workflows

**Admin Removal Process:**

1. Remove user from hardcoded admin list in `locals.tofu`
2. Run `tofu plan` and `tofu apply`
3. Manually remove user via platform UI (GitHub/Datadog)

**Security**: This two-step process prevents accidental loss of organization access during infrastructure changes.

## Outputs for Downstream Consumption

This foundational infrastructure provides outputs designed for consumption by downstream project deployment repositories:

### `teams`

Complete team infrastructure information including:

- Team metadata (display name, team type)
- Folder hierarchy (team type folder, team folder ID, environment folder IDs)
- Identity groups with email addresses, display names, descriptions, and roles

These outputs provide downstream repositories with all necessary information to deploy projects in the correct folders with appropriate access controls and governance.

## Validation Rules

### Team Types

- Must be exactly: `"platform-team"`, `"stream-aligned-team"`, `"complicated-subsystem-team"`, `"enabling-team"`

### Display Names

- Must be Title Case with first letter of each word capitalized
- Only letters, numbers, and spaces allowed
- The word "and" is allowed in lowercase (e.g., "Trust and Safety")

## Naming Conventions

- **Team Type folders**: Team Topologies categories with "Teams" suffix (e.g., "Platform Teams", "Stream-aligned Teams")
- **Team folders**: Use team display names from configuration (e.g., "Logos", "Ethos")
- **Environment folders**: Hardcoded environment names (e.g., "Sandbox", "Non-Production", "Production")
- **Google Identity groups**:
  - **Email format**: `{team_prefix}-{team_key}-{role}@{domain}` (e.g., `pt-logos-admin@osinfra.io`)
  - **Display name**: `"{Team Type}: {Team Name} {Role}"` (e.g., "Platform Team: Logos Admin")
- **GitHub Parent teams**: `{team_prefix}-{team_key}` (e.g., "pt-logos", "st-ethos")
- **GitHub Child teams**:
  - **Name format**: Hardcoded functional names (`sandbox-approver`, `non-production-approver`, `production-approver`, `repository-administrators`)
  - **Full team name**: `{parent_team}-{child_name}` (e.g., "pt-logos-sandbox-approver")
- **Datadog Teams**:
  - **Name**: `"{Team Type}: {Team Name}"` (e.g., "Platform Team: Logos")
  - **Handle**: `{team_prefix}-{team_key}` (e.g., "pt-logos")
