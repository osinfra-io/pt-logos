# GitHub Copilot Repository Instructions

## Purpose
This file defines simple, persistent coding standards and repository practices for GitHub Copilot. These instructions are synchronized across all related OpenTofu root module repositories.

## Coding Standards
- Always run pre-commit validation after changing OpenTofu files: `pre-commit run -a`.
- Document complex logic with comments.

## Code Quality Principles

- **Keep it simple (KISS)** - Favor straightforward solutions over clever ones. If there are multiple ways to solve a problem, choose the most obvious and maintainable approach.
- **Less is more** - Write only the code necessary to solve the problem at hand. Every line of code is a liability that must be maintained, tested, and understood.
- **Avoid over-engineering** - Don't add abstraction, flexibility, or complexity for hypothetical future needs. Solve today's problems today; refactor when actual requirements emerge.
- **Value clarity over brevity** - Longer, explicit code that's easy to understand is better than terse, "clever" code that saves a few lines but obscures intent.
- **Prefer explicit over implicit** - Make dependencies, transformations, and logic flows obvious. Magic behaviors and hidden assumptions create maintenance burden.
- **Write code for humans first** - Code is read far more often than it's written. Optimize for the next person who needs to understand and modify it.

## GitHub Actions

- All OpenTofu deployments are handled through GitHub Actions workflows using a reusable called workflow (osinfra-io/github-opentofu-gcp-called-workflows).
- There are two types of workflows:
  - Workflows that run directly on push to main (production only).
  - Workflows that run on PR creation and subsequent commits (sandbox environment), then automatically progress to non-production after merge to main, and finally production after non-production completes successfully.
- When modifying workflows, update the Mermaid diagram in the root README.md to reflect the changes.

## Repository Practices
- Local development does not have access to OpenTofu state. Tests are run in GitHub Actions workflows.
- Use symlinks for shared configuration files to avoid duplication.

## References
- [Repository instructions documentation](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)
