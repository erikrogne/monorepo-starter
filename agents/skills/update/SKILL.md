---
name: update
description: Pull latest skills and templates from upstream monorepo-starter. Use when the user says "update skills", "pull updates", "what's new in upstream", or wants to refresh their copy without losing local customizations.
---

# update

Refreshes skills, templates, and MCP integration menu from upstream `monorepo-starter` while preserving local customizations.

## When to use

- "Update my skills."
- "Pull the latest from upstream."
- "What's new?"
- After a long gap since the user last cloned or pulled.

## Steps

### 1. Identify upstream

Default upstream: `https://github.com/your-org/monorepo-starter` (or whatever the user forked from).

If the repo's `git remote` includes an `upstream` remote, use that. Otherwise ask the user for the upstream URL once and store it as `git remote add upstream <url>`.

### 2. Show the diff

Run `git fetch upstream`. Show the user what's changed in:

- `agents/skills/` — new or updated skill definitions
- `agents/skills/write/templates/` — new or updated document templates
- `.mcp.template.json` — new integrations on the menu
- `agents/crons/` — new background jobs
- Top-level docs (`AGENTS.md`, `ONBOARD.md`, `README.md`)

Skip diffs to:
- `identity/` (personal)
- `raw/`, `wiki/`, `projects/`, `memory/` (your data)
- `.mcp.json`, `.env` (your live config)

### 3. Categorize each change

For each changed file:

- **New file** → safe to copy in.
- **Upstream change, you haven't touched the file** → safe to fast-forward.
- **Both upstream and you changed it** → present a conflict, let the user pick.

### 4. Apply

For safe changes, write them through.

For conflicts, default to keeping the user's version unless they explicitly opt to take upstream. Show a 3-way diff if helpful.

### 5. Re-validate config

If `.mcp.template.json` got new entries, ask the user if they want to enable any of them. If yes, hand off to the `setup` skill.

If a SKILL.md changed materially, surface that — the user might need to know.

### 6. Summarize

Tell the user:
- What got updated.
- What was skipped (and why).
- Any new skills, templates, or MCPs they might want to enable.

## Notes

- **Never overwrite `identity/`, `raw/`, `wiki/`, `projects/`, `memory/`, `.mcp.json`, or `.env`** without explicit confirmation. These are user data.
- The `.monorepo-starter-version` file is the source of truth for "what version am I on". Update it after a successful pull.
- If the user has diverged significantly from upstream, suggest they consider whether their version warrants becoming its own template (the way `pm-plugin` did).
