# AGENTS.md — Starter Monorepo for Product Teams

This monorepo is a **starter template** for Product Managers and Product Designers to get started with AI coding agents. It provides smart defaults while remaining customizable.

> **What is AGENTS.md?** A standardized file that gives AI agents context about your project. Works with Claude Code, Cursor, Codex, Augment Code, and other agents that follow the [agents.md](https://agents.md/) standard.

---

## Quick Start

1. **Run onboarding**: User says "run onboarding" - follow `ONBOARD.md`
2. **Or skip**: User can manually edit `knowledge/about-you.md`
3. **Start working**: Read this file and available skills to assist

### Onboarding Detection

If `knowledge/about-you.md` still contains `[Your name]` or similar placeholders, offer to run onboarding:

> "I notice you haven't set up your context yet. Want me to run onboarding? It takes about 5-10 minutes and will personalize this workspace for you."

---

## Project Structure

```
monorepo-starter/
├── AGENTS.md              ← You are here (agent instructions)
├── README.md              ← Human-readable setup guide
├── knowledge/             ← Your context and preferences
│   ├── AGENTS.md
│   └── about-you.md       ← Fill this in first
├── meetings/              ← Meeting notes and transcripts
│   └── AGENTS.md
├── docs/                  ← Documentation and examples
│   ├── AGENTS.md
│   └── examples/
└── tools/                 ← AI agent extensions
    ├── AGENTS.md          ← Tools overview
    ├── skills/            ← Reusable AI workflows
    ├── prompts/           ← Prompt templates
    ├── mcp/               ← MCP server configs
    └── cli/               ← Command-line utilities (QMD)
```

---

## Who Uses This

This starter is designed for:

- **Product Managers** writing PRDs, specs, research synthesis, stakeholder comms
- **Product Designers** prototyping, creating specs, Figma-to-code workflows
- **Non-technical users** who want AI agents to help with product work

---

## Agent Protocol

### Before Starting Work

1. **Read `knowledge/about-you.md`** to understand the user context
2. **Check `tools/skills/AGENTS.md`** to see available workflows
3. **Ask clarifying questions** if the task is ambiguous

### Communication Style

- Be direct and concise
- Use bullet points for structure
- Provide options with trade-offs when decisions are needed
- Avoid jargon; explain technical terms if necessary

### When Creating Files

- Place new documents in `docs/` unless otherwise specified
- Use templates from `tools/prompts/` when available
- Name files descriptively: `YYYY-MM-DD-topic.md`

---

## Tools Overview

See `tools/AGENTS.md` for full details.

| Tool | Purpose |
|------|---------|
| **Skills** | Reusable AI workflows (brainstorming, copywriting, etc.) |
| **Prompts** | Templates for PRDs, design specs, research |
| **MCP** | Connect to Figma, Jira, Gmail, Calendar |
| **CLI** | QMD for fast markdown search |

---

## Skills Quick Reference

| Skill | When to Use |
|-------|-------------|
| `brainstorming` | Starting a new feature, exploring ideas |
| `copywriting` | Writing marketing copy, landing pages |
| `doc-coauthoring` | Co-writing PRDs, specs, documentation |
| `frontend-design` | Creating UI prototypes, design systems |
| `humanizer` | Making AI text sound more natural |
| `internal-comms` | Status updates, newsletters, FAQs |
| `user-research` | Synthesizing interviews, surveys |

---

## CLI Tools

### QMD (Quick Markdown Search)

Token-efficient search. Use instead of reading multiple files.

```bash
qmd update                        # Update index first
qmd search "keyword" -n 5         # Fast keyword search
qmd query "question" -n 10        # Best quality search
```

---

## Customization

### Adding Your Context

Edit `knowledge/about-you.md` with:
- Your role and team
- Key projects and goals
- Preferences and working style

### Adding Skills

1. Create a folder in `tools/skills/` with the skill name
2. Add a `SKILL.md` file with instructions
3. Update `tools/skills/AGENTS.md` index

### Adding MCP Integrations

Edit `tools/mcp/mcp-servers.json` to add new servers.
See `tools/mcp/mcp-setup.md` for setup instructions.

---

## Resources

- [agents.md standard](https://agents.md/)
- [Anthropic Skills](https://github.com/anthropics/skills)
- [Skills.sh](https://skills.sh/)
- [Claude Code](https://claude.ai/code)
- [Cursor](https://cursor.sh/)
