# AGENTS.md — Starter Monorepo for Product Teams

This monorepo is a **starter template** for Product Managers and Product Designers to get started with AI coding agents. It provides smart defaults while remaining customizable.

> **What is AGENTS.md?** A standardized file that gives AI agents context about your project. Works with Claude Code, Cursor, Codex, Augment Code, and other agents that follow the [agents.md](https://agents.md/) standard.

---

## Quick Start

1. **Run onboarding**: User says "run onboarding" → follow `ONBOARD.md`
2. **Or skip**: User can manually edit `knowledge/about-you.md`
3. **Start working**: Read this file and available skills to assist

### Onboarding Detection

If `knowledge/about-you.md` still contains `[Your name]` or similar placeholders, offer to run onboarding:

> "I notice you haven't set up your context yet. Want me to run onboarding? It takes about 5-10 minutes and will personalize this workspace for you."

---

## Self-Improvement System

**This AGENTS.md file should continuously improve.** After completing tasks, update this file and sub-AGENTS.md files with:

### What to Capture

1. **User Preferences** — Communication style, format preferences, pet peeves
2. **Learned Patterns** — Workflows that work well, common requests
3. **Corrections** — Things the user corrected or adjusted
4. **New Skills** — Skills installed from skills.sh
5. **Tool Configurations** — MCP setups, CLI preferences

### When to Update

- After onboarding completion
- After user corrects agent behavior
- After discovering a workflow pattern
- After installing new skills
- Weekly: review and consolidate learnings

### How to Update

Add a `## User Preferences` section below (created during onboarding) and append learnings:

```markdown
## User Preferences

*Generated from onboarding on YYYY-MM-DD*

- **Name:** [name]
- **Role:** [role] at [company]
- **Style:** [communication style]
- **Prefers:** [format preferences]
- **Avoid:** [pet peeves]

### Learned Patterns

- [Pattern discovered during work]
- [Another pattern]

### Corrections Log

- YYYY-MM-DD: [What was corrected]
```

### Sub-AGENTS.md Updates

Each folder has its own AGENTS.md. Update them when:
- User adds new content to that folder
- A workflow specific to that folder emerges
- Folder-specific preferences are discovered

---

## Project Structure

```
monorepo-starter/
├── AGENTS.md              ← You are here (agent instructions)
├── ONBOARD.md             ← Onboarding guide for new users
├── README.md              ← Human-readable setup guide
├── knowledge/             ← Your context and preferences
│   ├── AGENTS.md
│   └── about-you.md       ← Fill this in first
├── meetings/              ← Meeting notes and transcripts
│   └── AGENTS.md
├── docs/                  ← Documentation and examples
│   ├── AGENTS.md
│   └── examples/
└── .agents/                 ← Agent extensions (skills, prompts, MCP)
    ├── AGENTS.md          ← Extensions overview
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
2. **Check `.agents/skills/AGENTS.md`** to see available workflows
3. **Use QMD** for searching: `qmd search "topic"` or `qmd query "question"`
4. **Ask clarifying questions** if the task is ambiguous

### Communication Style

- Be direct and concise
- Use bullet points for structure
- Provide options with trade-offs when decisions are needed
- Avoid jargon; explain technical terms if necessary

### When Creating Files

- Place new documents in `docs/` unless otherwise specified
- Use templates from `.agents/prompts/` when available
- Name files descriptively: `YYYY-MM-DD-topic.md`

---

## Tools Overview

See `.agents/AGENTS.md` for full details.

| Tool | Purpose |
|------|---------|
| **Skills** | Reusable AI workflows (brainstorming, copywriting, etc.) |
| **Prompts** | Templates for PRDs, design specs, research |
| **MCP** | Connect to Figma, Jira, Gmail, Calendar |
| **CLI** | QMD for fast markdown search |

### QMD (Required)

Always use QMD instead of reading multiple files:

```bash
qmd update                        # Update index (run first)
qmd search "keywords" -n 5        # Fast keyword search
qmd query "question" -n 10        # Best quality search
```

### Finding New Skills

Search [skills.sh](https://skills.sh) for additional capabilities:

```bash
npx skills find [topic]           # Search for skills
npx skills add owner/repo@skill   # Install a skill
```

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
| `pptx` | Creating presentations |
| `pdf` | Generating PDF documents |

---

## Recommended Editor

**[Obsidian](https://obsidian.md/)** — Free markdown editor with excellent features.

Setup: File → Open Vault → Select this repo folder.

Benefits:
- Visual editing of markdown files
- Graph view shows connections between notes
- Works offline, files stay local
- Plugins for calendars, kanban boards, etc.

---

## Customization

### Adding Your Context

Edit `knowledge/about-you.md` with:
- Your role and team
- Key projects and goals
- Preferences and working style

### Adding Skills

1. Search skills.sh: `npx skills find [topic]`
2. Install: `npx skills add owner/repo@skill-name`
3. Or create manually in `.agents/skills/` with a `SKILL.md` file

### Adding MCP Integrations

Edit `.agents/mcp/mcp-servers.json` to add new servers.
See `.agents/mcp/mcp-setup.md` for setup instructions.

---

## Resources

- [agents.md standard](https://agents.md/)
- [Skills.sh](https://skills.sh/) — Community skills marketplace
- [Anthropic Skills](https://github.com/anthropics/skills)
- [Obsidian](https://obsidian.md/) — Recommended markdown editor
- [Claude Code](https://claude.ai/code)
- [Cursor](https://cursor.sh/)
