# agents/AGENTS.md

This directory holds everything an AI agent uses to operate inside this repo: skills, MCP server references, custom CLI references, and crons.

## Subdirectories

- `skills/` — the 9 core skills, each in its own subdirectory with a `SKILL.md`.
- `mcp/` — reference notes for MCP servers used by this repo. The actual server configurations live in `.mcp.json` (live) and `.mcp.template.json` (menu).
- `cli/` — reference notes for any custom CLI tools you wire into the system.
- `crons/` — background jobs (session-sync, qmd-update). See `crons/AGENTS.md` for installation.

## Conventions

- Every skill is a directory with a `SKILL.md` at the root.
- Skill names are bare verbs (`setup`, `write`, `compile`) — no prefix.
- A skill may include `templates/`, `scripts/`, `examples/` as needed.
- Skills are read by all four agents (Claude Code, Codex, Augment, Cursor) — keep them agent-agnostic.
