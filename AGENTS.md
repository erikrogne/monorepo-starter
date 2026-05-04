# AGENTS.md — monorepo-starter

This is the top-level protocol every AI agent (Claude Code, Codex, Augment, Cursor) reads first when working in this repository. It tells you what this repo is, where to look, and how to behave.

---

## What this repo is

A generic, knowledge-worker context engine. One person's evolving second brain — identity, projects, raw inputs, compiled wiki, session memory — laid out as markdown so any AI agent can pick up where the last one left off.

Treat the user as: a knowledge worker (engineer / PM / designer / founder / writer / researcher — they'll tell you which) who wants their AI agents to share context, learn from past work, and not require restating preferences every session.

---

## Read these first (every session)

1. `identity/about-you.md` — who the user is, what they do, current focus.
2. `identity/voice-guide.md` — how they write and want responses written.
3. `projects/` — what's active right now.
4. `memory/session-logs/curated/` — short-term memory from recent sessions (if present).

If `identity/about-you.md` or `identity/voice-guide.md` is missing or empty, prompt the user to run the `onboard` skill before doing substantive work.

---

## Layout

| Path | Purpose | Who writes here |
|------|---------|-----------------|
| `identity/` | Who the user is, voice, values | User (with agent help during `onboard`) |
| `raw/` | Immutable source data (meetings, notes) | Sync scripts only — **read-only for agents** |
| `wiki/` | AI-compiled knowledge | Agents (via `compile` skill) |
| `projects/` | Active time-bound work | User + agents |
| `memory/session-logs/` | AI agent session transcripts | Cron + agents (curated subfolder) |
| `agents/skills/` | The 9 core skills | Maintainers |
| `agents/crons/` | Background jobs (session-sync, qmd-update) | Maintainers |
| `agents/cli/` | Reference for custom CLI tools | User-defined |
| `agents/mcp/` | Reference for adding MCP servers | User-defined |

---

## Skills

Skills live in `agents/skills/<skill>/SKILL.md`. The 9 core skills:

| Skill | When to use |
|-------|-------------|
| `setup` | First run after clone — installs MCPs, optional crons. |
| `onboard` | Fill in `identity/about-you.md` and `voice-guide.md` interactively. |
| `session` | Save / resume working state across sessions. |
| `compile` | Synthesize raw inputs into `wiki/` entries. |
| `write` | Draft documents (PRD, one-pager, status, brief, spec) in the user's voice. |
| `research` | Multi-source aggregator (web + connected MCPs). |
| `review` | Critique a document for structure, clarity, voice. |
| `brainstorm` | Open-ended exploration before committing to an approach. |
| `update` | Pull latest skills / templates from upstream `monorepo-starter`. |

Match user intent against skill descriptions. If unsure which fits, ask. If a skill exists for the task, **use it** rather than freelancing.

---

## Behavior rules

1. **Raw is immutable.** Never edit anything in `raw/`. Synthesize into `wiki/` instead.
2. **Identity drives voice.** Match the tone described in `identity/voice-guide.md`. If missing, ask once.
3. **Tasks over prose.** For multi-step work, use the agent's task management. Mark tasks complete as you go.
4. **Cite your sources.** When you draw from `raw/` or `wiki/`, link the file with a relative path or `[[wikilink]]` if the user prefers Obsidian-style linking.
5. **No new top-level dirs without asking.** This layout is part of the contract.
6. **Prefer existing skills over ad-hoc prompts.** Read `agents/skills/<skill>/SKILL.md` before improvising.
7. **Never commit secrets.** Tokens belong in `.env` or per-agent local config — `.gitignore` enforces this.
8. **Write to the right surface.** Decisions go in `wiki/decisions/`. People notes go in `wiki/people/`. Concepts go in `wiki/concepts/`. Project state goes in `projects/<name>/`.

---

## Cross-agent compatibility notes

- **Claude Code** reads this file and skills via the `.claude-plugin/` manifest.
- **Augment** reads this file and skills via the `.augment-plugin/` manifest.
- **Codex** reads this file via the `.codex-plugin/` manifest.
- **Cursor** does not (yet) have a formal plugin manifest. It reads `AGENTS.md` directly from the repo root.

All four agents share the same `.mcp.json`, the same skills directory, and the same memory layout. A session started in one agent can be resumed in another.

---

## When something is ambiguous

Ask. Don't guess at scope, role, voice, or tooling preferences. The user has explicitly said they prefer questions over assumptions in `identity/voice-guide.md` (or will, after `onboard`).
