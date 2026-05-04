# monorepo-starter

A generic, knowledge-worker version of the personal context-engine pattern. One repo that any AI coding agent — Claude Code, Codex, Augment, Cursor — can use as a long-lived second brain.

> If you've seen the `pm-plugin` (a Pure-Storage-flavored variant) or a fully personal monorepo built on this pattern, this is the *role-agnostic starter*. Pick what you need, drop what you don't.

## What you get

- **Plugin scaffold** — manifests for Claude Code (`.claude-plugin/`), Augment (`.augment-plugin/`), Codex (`.codex-plugin/`), so this repo registers as a plugin in each agent.
- **MCP wizard** — day-1 `.mcp.json` ships with no credentials. A `setup` skill reads `.mcp.template.json`, asks you which integrations you want (GitHub, Linear, Notion, Slack, Jira/Confluence, Google Drive, Sentry, Playwright, Postgres, Figma desktop), collects tokens, and writes a personalized config.
- **9 skills** — `setup`, `onboard`, `session`, `compile`, `write`, `research`, `review`, `brainstorm`, `update`. Each is a self-contained instruction set in `agents/skills/`.
- **Session memory** — `memory/session-logs/{augment,cursor,codex,claude,curated}/` plus a nightly `session-sync` cron that pulls AI agent transcripts into the repo so context survives across sessions.
- **Knowledge graph layout** — `identity/`, `raw/`, `wiki/`, `projects/`, each with its own `AGENTS.md` instructions.

## Quickstart

```bash
git clone <your-fork> monorepo-starter
cd monorepo-starter
./setup.sh
```

Then open the directory in your AI agent and say:

> "Run the setup skill."

The skill walks you through identity, MCP picks, and optional crons.

## Layout

```
monorepo-starter/
├── AGENTS.md                top-level protocol every agent reads first
├── ONBOARD.md               human-readable onboarding guide
├── README.md                this file
├── setup.sh                 prerequisite check + bootstrap
├── .claude-plugin/          Claude Code manifest + marketplace entry
├── .augment-plugin/         Augment manifest
├── .codex-plugin/           Codex manifest
├── .mcp.json                day-1 MCP config (no creds)
├── .mcp.template.json       MCP integration menu
├── agents/
│   ├── cli/                 reference for any custom CLI tools you build
│   ├── mcp/                 reference for adding more MCP servers
│   ├── crons/               session-sync + qmd-update + install.sh
│   └── skills/              the 9 core skills
├── identity/                about-you, voice-guide
├── memory/session-logs/     AI agent transcript inbox (per-agent)
├── projects/                active projects (PARA: Projects)
├── raw/                     immutable inputs (meetings, notes)
└── wiki/                    AI-compiled knowledge (concepts, decisions, people, summaries)
```

## Philosophy

- **Filesystem-first.** Markdown files are canonical. Any agent can read the directory, understand state, and continue your work.
- **Raw is immutable.** AI agents synthesize from `raw/` to `wiki/`. They never modify `raw/`.
- **Skills over prompts.** Each capability is a discoverable skill with its own SKILL.md.
- **Bring your own role.** This starter has no opinions on whether you're an engineer, PM, designer, or founder. Customize `identity/` and the `write` skill templates.

## License

MIT. See `LICENSE`.
