# Changelog

All notable changes to monorepo-starter will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] — 2026-05-04

Initial release. A generic, knowledge-worker version of the personal context-engine pattern — works across Claude Code, Codex, Augment, and Cursor as a plugin.

### Added

- **Plugin manifests** for Claude Code, Augment, and Codex (`.claude-plugin/`, `.augment-plugin/`, `.codex-plugin/`) plus a Claude marketplace entry.
- **Day-1 MCP config** (`.mcp.json`) ships with only credential-free servers (`figma-desktop`, `notebooklm`) so a fresh install never shows broken MCPs.
- **MCP template** (`.mcp.template.json`) — source-of-truth for 10 common integrations (GitHub, Linear, Notion, Slack, Jira Cloud, Confluence Cloud, Google Drive, Sentry, Playwright, PostgreSQL) that the `setup` skill installs on demand.
- **9 core skills:** `setup`, `onboard`, `session`, `compile`, `write`, `research`, `review`, `brainstorm`, `update`.
- **Session memory** — `memory/session-logs/{augment,cursor,codex,claude,curated}/` with a nightly `session-sync` cron that pulls AI agent transcripts into the repo.
- **QMD weekly index refresh cron** — keeps markdown search current.
- **Knowledge graph layout** — `identity/`, `raw/{meetings,notes}/`, `wiki/{concepts,decisions,people,summaries}/`, `projects/` with per-directory AGENTS.md files.
- **Bootstrap script** — `setup.sh` installs `uv` and prints next-step guidance.
