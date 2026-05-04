---
name: setup
description: First-run wizard. Configures MCP integrations and optional crons. Use when the user says "run setup", "set up MCPs", "configure integrations", or after a fresh clone.
---

# setup

The first thing a user runs after cloning. Walks them through MCP integration choices and optional background jobs.

## When to use

- User says "run the setup skill", "set up MCPs", "configure integrations".
- User just cloned the repo and `./setup.sh` exited with the "next steps" message.
- User wants to add or remove an integration after the fact.

## Steps

### 1. Verify bootstrap ran

Check that `setup.sh` has been run by confirming `git`, `node`, `npx`, and `uv` are on PATH. If not, ask the user to run `./setup.sh` first.

### 2. Show the integration menu

Read `.mcp.template.json`. For each `mcpServer` entry, present:
- Name
- `_description`
- `_required_env` (so the user knows what tokens they need)
- `_token_url` (where to get those tokens)

Ask the user which they want to enable. Accept "all", a comma-separated list, or "none".

### 3. Collect tokens

For each chosen integration, prompt for the values listed in `_required_env`. Write them to `.env` at the repo root (create if missing). `.env` is gitignored.

If a token URL is provided, remind the user where to obtain the token. Don't fetch tokens yourself.

### 4. Render `.mcp.json`

For each chosen integration, copy the entry from `.mcp.template.json` into `.mcp.json`, stripping `_description`, `_required_env`, and `_token_url` keys (they're documentation-only).

Preserve any pre-existing entries in `.mcp.json` unless the user explicitly opts to replace.

### 5. Per-agent config (optional)

Some agents read MCP config from their own location (e.g. `~/.claude/mcp_settings.json`, `~/.codex/config.toml`). Ask the user if they want the chosen MCPs propagated to their agent config too. If yes, copy the relevant entries into the agent's config file.

### 6. Crons (optional)

Ask if the user wants to install the optional crons:

- `session-sync` — pulls AI agent transcripts into `memory/session-logs/`.
- `qmd-update` — refreshes a markdown search index (only useful if `qmd` or similar is installed).

If yes, run `agents/crons/install.sh <cron-name>`.

### 7. Confirm and summarize

Tell the user:
- Which MCPs are now active (and which need a restart of the agent to pick up).
- Where their tokens are stored (`.env`).
- Which crons are scheduled.
- Suggested next step: `run the onboard skill`.

## Notes

- Never commit `.env`. The shipped `.gitignore` excludes it; verify before exiting.
- If a token is missing or wrong, the MCP will show as red in the agent. The user can re-run this skill to fix.
- The skill is idempotent — safe to re-run.
