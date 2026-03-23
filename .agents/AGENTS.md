# .agents — Extensions for AI Agents

This folder contains extensions that enhance AI agent capabilities.

---

## Overview

| Folder | Purpose |
|--------|---------|
| `skills/` | Reusable AI workflows |
| `prompts/` | Template prompts for common tasks |
| `mcp/` | Model Context Protocol server configs |
| `cli/` | Command-line utilities |

---

## Skills

Reusable workflows for specific tasks. See `skills/AGENTS.md` for the full index.

**Usage:** Ask the agent to use a skill:
> "Use the brainstorming skill to help me design a new feature"

---

## Prompts

Template prompts for common PM/Designer tasks:

- `prd-template.md` — Product requirements document
- `design-spec.md` — Design specification
- `research-synthesis.md` — User research summary
- `stakeholder-update.md` — Status updates

**Usage:** Reference a template:
> "Create a PRD using the prd-template"

---

## MCP (Model Context Protocol)

Connect AI agents to external tools. Configuration in `mcp/mcp-servers.json`.

**Configured servers:**
- Figma — Design file access
- Linear — Issue tracking
- Gmail — Email integration
- Google Calendar — Scheduling

See `../docs/mcp-setup.md` for setup instructions.

---

## CLI Tools

Command-line utilities for working with your data.

### QMD (Quick Markdown Search)

Token-efficient markdown search. Use instead of grep + reading full files.

```bash
# Update index (run first)
qmd update

# Search commands
qmd search "keyword query" -n 5      # Fast keyword search
qmd vsearch "conceptual query"       # Semantic search
qmd query "detailed question" -n 10  # Hybrid + reranking

# Get full document
qmd get "path/to/file.md"
```

**When to use:**
- Searching notes and docs for topics
- Finding information across markdown files
- Pre-retrieval before answering questions

**Install:** See [qmd documentation](https://github.com/anthropics/qmd)
