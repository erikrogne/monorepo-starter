# ONBOARD.md — first 30 minutes with monorepo-starter

This is the human-readable onboarding guide. The agent-readable equivalent is `AGENTS.md`.

## Step 1 — bootstrap (2 min)

```bash
./setup.sh
```

Verifies prerequisites (git, node, npx, uv) and prints next-step guidance. Idempotent.

## Step 2 — register the plugin (3 min)

| Agent | What to do |
|-------|-----------|
| **Claude Code** | `claude plugins install ./` from the repo root, or add the directory as a marketplace source. |
| **Augment** | The `.augment-plugin/plugin.json` is auto-discovered when this directory is open in VS Code with the Augment extension. |
| **Codex** | The `.codex-plugin/plugin.json` is auto-discovered when Codex is launched in this directory. |
| **Cursor** | No plugin manifest needed — Cursor reads `AGENTS.md` directly. |

After install, your agent should know about the 9 skills.

## Step 3 — run the setup skill (5–10 min)

In your AI agent, say:

> "Run the setup skill."

It will:

1. Confirm prerequisites are in place.
2. Walk you through MCP integrations — show you the menu in `.mcp.template.json` and let you pick which ones to enable.
3. Collect the tokens for what you picked (stored in `.env`, never committed).
4. Write a personalized `.mcp.json`.
5. Optionally install the `session-sync` and `qmd-update` crons.

You can re-run it any time to add or remove integrations.

## Step 4 — onboard yourself (10 min)

> "Run the onboard skill."

Asks you a short series of questions about:

- Who you are, role, current focus.
- How you write — formal/casual, long/short, opinions on em dashes, etc.
- What "good output" looks like to you.

Result: `identity/about-you.md` and `identity/voice-guide.md` populated. Every future session reads these first.

## Step 5 — first real task

Pick one:

- **Got a meeting transcript?** Drop the file in `raw/meetings/` and ask the agent to "compile it." That triggers the `compile` skill.
- **Need to write something?** Ask "write a one-pager about X." Triggers the `write` skill.
- **Researching a topic?** Ask "research X across the web and my connected MCPs." Triggers `research`.

## Step 6 — coming back tomorrow

Just say "resume" or "what was I working on." If the `session-sync` cron is installed, your agent will have access to yesterday's transcripts in `memory/session-logs/`.

If you skip the cron, the `session` skill can still save and reload state on demand:

> "Save my session." → writes a snapshot to `memory/session-logs/curated/`.
>
> "Resume." → reads the latest snapshot.

## Customizing

- **Add a new skill:** `agents/skills/<name>/SKILL.md`. Follow the format of any existing skill.
- **Change the persona:** edit `identity/about-you.md` and `voice-guide.md` directly, or re-run `onboard`.
- **Add an MCP server:** add it to `.mcp.template.json` and re-run the `setup` skill.
- **Pull updates from upstream:** ask the agent to "run the update skill."

## Troubleshooting

- **MCPs show red in Claude Code.** A token is missing. Re-run `setup` and re-pick that integration.
- **Agent doesn't see skills.** Verify the plugin manifest matches the agent (`.claude-plugin/`, `.augment-plugin/`, `.codex-plugin/`).
- **`uv` not found when an MCP needs `uvx`.** Re-run `./setup.sh` — it installs `uv` for you, or follow https://astral.sh/uv.
