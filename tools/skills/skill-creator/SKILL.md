---
name: skill-creator
description: Guide for creating effective skills that extend AI agent capabilities with specialized knowledge, workflows, or tool integrations.
---

# Skill Creator

Create effective skills to extend AI agent capabilities.

## What is a Skill?

A modular package that provides:
- Specialized workflows
- Domain expertise
- Bundled resources (scripts, templates)

## Skill Structure

```
skill-name/
├── SKILL.md (required)
└── resources/ (optional)
    ├── scripts/
    ├── references/
    └── assets/
```

## SKILL.md Format

```markdown
---
name: skill-name
description: When to use this skill (this triggers activation)
---

# Skill Title

Instructions for using the skill...
```

## Best Practices

### Be Concise
Only add context AI doesn't already have. Challenge each piece: "Does this justify its token cost?"

### Match Freedom to Task
- **High freedom**: When multiple approaches are valid
- **Low freedom**: When operations are fragile or consistency is critical

### Progressive Disclosure
- Keep SKILL.md lean (<500 lines)
- Move details to reference files
- Load additional context only when needed

## Creating a New Skill

1. Identify the task and concrete examples
2. Plan what resources would help
3. Create SKILL.md with frontmatter
4. Add any supporting files
5. Test with real usage
6. Iterate based on feedback
