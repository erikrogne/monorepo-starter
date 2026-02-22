# Monorepo Starter for Product Teams

A starter template for **Product Managers** and **Product Designers** to work with AI coding agents like Claude Code, Cursor, Codex, and Augment Code.

## What's This?

This monorepo provides a structured environment for AI agents to help you with:

- Writing PRDs and product specs
- Creating prototypes and UI designs
- Synthesizing user research
- Drafting stakeholder communications
- Generating Figma-to-code conversions

## Quick Start

### 1. Clone this repo

```bash
git clone https://github.com/erikrogne/monorepo-starter.git
cd monorepo-starter
```

### 2. Run onboarding (recommended)

Open the repo in your AI agent and say:

> **"Run onboarding"**

This 5-10 minute guided setup will:
- Learn about your role, tools, and communication style
- Generate your personalized configuration files
- Recommend skills and integrations for your workflow

*Or manually edit `knowledge/about-you.md` if you prefer.*

### 3. Install an AI agent

Choose one of these tools:

| Agent | Best For | Install |
|-------|----------|---------|
| [Claude Code](https://claude.ai/code) | General tasks, PRDs, research | Web-based |
| [Cursor](https://cursor.sh/) | Code editing, prototypes | Desktop app |
| [Codex](https://openai.com/codex) | Automation, scripting | API |
| [Augment Code](https://augment.dev/) | Enterprise, codebase context | Desktop app |

### 4. Start working

Open the repo in your agent and start asking for help:

- "Write a PRD for a new feature"
- "Create a React prototype for this wireframe"
- "Summarize the user research in docs/examples/"
- "Draft a status update for my stakeholders"

## Structure

```
monorepo-starter/
├── AGENTS.md          # Instructions for AI agents (don't edit unless customizing)
├── README.md          # You are here
├── knowledge/         # Your context
│   └── about-you.md   # Fill this in first
├── skills/            # Reusable AI workflows
├── prompts/           # Prompt templates
└── docs/              # Documents and examples
    ├── templates/
    └── examples/
```

## Customization

### Adding Your Own Skills

Create a folder in `skills/` with a `SKILL.md` file:

```
skills/
└── my-custom-skill/
    └── SKILL.md
```

### Using Prompts

Copy templates from `prompts/` and customize for your needs.

## MCP Integrations (Optional)

For advanced users, you can connect external tools via MCP:

- **Figma** - Access design files
- **Jira/Linear** - Sync issues
- **Gmail** - Draft emails
- **Google Calendar** - Check availability

See `docs/mcp-setup.md` for setup instructions.

## Resources

- [agents.md Standard](https://agents.md/) - Learn about AGENTS.md
- [Anthropic Skills](https://github.com/anthropics/skills) - More skills
- [Skills.sh](https://skills.sh/) - Community skills

## License

MIT
