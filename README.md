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

### 1. Create Your Repository

Click **"Use this template"** → **"Create a new repository"** on GitHub.

Then clone your new repo:
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 2. Prerequisites

Make sure you have these installed:

| Tool | Check | Install (Mac) |
|------|-------|---------------|
| **Git** | `git --version` | `xcode-select --install` |
| **Node.js** | `node --version` | [nodejs.org](https://nodejs.org/) or `brew install node` |
| **Homebrew** (Mac) | `brew --version` | [brew.sh](https://brew.sh/) or `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` |

### 3. Install an AI Agent

Choose one of these tools:

| Agent | Best For | Install |
|-------|----------|---------|
| [Claude Code](https://claude.ai/code) | General tasks, PRDs, research | Web-based |
| [Cursor](https://cursor.sh/) | Code editing, prototypes | Desktop app |
| [Windsurf](https://codeium.com/windsurf) | Code editing, context-aware | Desktop app |
| [Augment Code](https://augment.dev/) | Enterprise, codebase context | VS Code extension |

### 4. Run Onboarding

Open the repo in your AI agent and say:

> **"Run onboarding"**

This 5-10 minute guided setup will:
- Install recommended tools (QMD for search, Obsidian for editing)
- Learn about your role, tools, and communication style
- Generate your personalized configuration files
- Search [skills.sh](https://skills.sh) for additional skills matching your workflow
- Set up automatic indexing and self-improvement

*Or manually edit `knowledge/about-you.md` if you prefer.*

### 5. Start Working

Open the repo in your agent and start asking for help:

- "Write a PRD for a new feature"
- "Create a React prototype for this wireframe"
- "Summarize the user research in docs/examples/"
- "Draft a status update for my stakeholders"

## Recommended Tools

| Tool | Purpose | Install |
|------|---------|---------|
| **[Obsidian](https://obsidian.md/)** | Edit markdown files | Open this repo as a vault |
| **QMD** | Fast markdown search | `npm install -g qmd` |

**Obsidian Setup:** File → Open Vault → Select this repo folder. This gives you a nice UI for editing your knowledge base.

## Structure

```
monorepo-starter/
├── AGENTS.md          # Instructions for AI agents
├── ONBOARD.md         # Onboarding guide (agents read this)
├── README.md          # You are here
├── knowledge/         # Your context
│   └── about-you.md   # Fill this in first
├── tools/
│   ├── skills/        # Reusable AI workflows
│   ├── prompts/       # Prompt templates
│   └── mcp/           # External tool integrations
└── docs/              # Documents and examples
```

## Self-Improving System

This monorepo is designed to improve itself. After each session, the AI agent will:

1. **Update AGENTS.md** with learned preferences and patterns
2. **Suggest new skills** from [skills.sh](https://skills.sh) based on your workflows
3. **Refine sub-AGENTS.md files** in each folder for better context

You don't need to maintain these files manually—just work with your AI agent and it will keep things current.

## Resources

- [agents.md Standard](https://agents.md/) - Learn about AGENTS.md
- [Skills.sh](https://skills.sh/) - Community skills marketplace
- [Anthropic Skills](https://github.com/anthropics/skills) - Official skills

## License

MIT
