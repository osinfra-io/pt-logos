# teams/

Each file in this directory defines one team's configuration as a HCL map entry
consumed by `pt-logos` via `-var-file`.

## Schema reference

The full schema is documented on the [Team Topology](https://osinfra-io.github.io/docs/platform-grouping/logos/team-topology)
page of the platform docs. Every field — required vs optional, types, constraints,
and what each flag enables — is described there.

## Creating a new team

Use the MCP server's `render_team_tfvars` tool to generate a correctly formatted
`.tfvars` file from a JSON spec. The tool validates the spec against
`schema/team.schema.json` before rendering, so any structural errors are caught
before you open a PR.
