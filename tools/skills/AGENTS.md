# Skills Index

This folder contains reusable AI workflows (skills) that help with specific tasks.

## How to Use Skills

**Method 1: Ask for it**
Just tell the agent which skill to use:
> "Use the brainstorming skill to help me design a new feature"

**Method 2: Let the agent choose**
The agent will automatically use relevant skills based on your request.

---

## Available Skills

| Skill | When to Use |
|-------|-------------|
| [brainstorming](./brainstorming/) | Starting a new feature, exploring ideas |
| [copywriting](./copywriting/) | Writing marketing copy, landing pages |
| [doc-coauthoring](./doc-coauthoring/) | Co-writing PRDs, specs, documentation |
| [frontend-design](./frontend-design/) | Creating UI prototypes, design systems |
| [internal-comms](./internal-comms/) | Status updates, newsletters, FAQs |
| [skill-creator](./skill-creator/) | Creating your own custom skills |
| [user-research](./user-research/) | Synthesizing interviews, surveys |
| [webapp-testing](./webapp-testing/) | Testing web prototypes |

---

## Adding New Skills

1. Create a folder with the skill name: `skills/my-skill/`
2. Add a `SKILL.md` file with instructions
3. Update this index

Or use the **skill-creator** skill to guide you through the process!

### SKILL.md Template

```markdown
---
name: my-skill
description: Brief description for when to trigger this skill
---

# My Skill

## When to Use
- Scenario 1
- Scenario 2

## Process
1. Step 1
2. Step 2

## Output
What the skill produces
```

---

## Skill Sources

Find more skills at:
- [Anthropic Skills](https://github.com/anthropics/skills)
- [Skills.sh](https://skills.sh/)
