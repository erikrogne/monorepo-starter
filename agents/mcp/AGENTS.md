# agents/mcp/AGENTS.md

Reference notes for the MCP servers wired into this repo.

The live server configuration is in `.mcp.json` at the repo root (no creds, day-1 only).
The full menu of available integrations is in `.mcp.template.json`.

## Adding a new MCP server

1. Add an entry to `.mcp.template.json` following the existing shape:
   - `_description` — one-line purpose.
   - `_required_env` — array of env var names the user must provide.
   - `_token_url` — where the user obtains the credential (optional but helpful).
   - `command` / `args` / `env` — actual MCP server invocation.
2. Re-run the `setup` skill. It will detect the new entry and offer it on the menu.
3. (Optional) Document it here with a short note on what it's good for and gotchas.

## Per-server notes

Add one file per server you've installed and have opinions on, e.g. `notion.md`:

```markdown
# Notion MCP

Best for: page lookup, database queries, search across your workspace.
Gotchas: requires the integration to be added to each page/database explicitly. Bot won't see anything you haven't shared with it.
Useful skills: `research` (cross-source aggregation), `compile` (turn raw notes into wiki entries with Notion as a source).
```
