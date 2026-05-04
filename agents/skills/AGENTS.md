# agents/skills/AGENTS.md

The skill registry. Each subdirectory is one skill, with a `SKILL.md` describing what it does and how to invoke it.

## The 9 core skills

| Skill | One-liner |
|-------|-----------|
| `setup` | First-run wizard. Installs MCPs, optional crons. |
| `onboard` | Populate `identity/about-you.md` and `voice-guide.md`. |
| `session` | Save / resume working state across sessions. |
| `compile` | Synthesize `raw/` into `wiki/`. |
| `write` | Draft documents (PRD, one-pager, status, brief, spec) in the user's voice. |
| `research` | Multi-source aggregator (web + connected MCPs). |
| `review` | Critique a document for structure, clarity, voice. |
| `brainstorm` | Open-ended exploration before committing to an approach. |
| `update` | Pull latest skills / templates from upstream. |

## How agents pick a skill

1. Match the user's intent against the skill descriptions in each `SKILL.md`.
2. If a skill clearly applies, **read its SKILL.md and follow it.** Don't freelance.
3. If two skills could apply, ask the user which fits.
4. If no skill fits, do the task directly — and if the same kind of request shows up twice, suggest creating a new skill.

## Skill structure

```
agents/skills/<name>/
├── SKILL.md           ← required. Description, when to use, steps.
├── templates/         ← optional. Document templates the skill emits.
├── scripts/           ← optional. Shell or node helpers.
└── examples/          ← optional. Reference outputs.
```

## SKILL.md frontmatter

```yaml
---
name: <skill-name>
description: One sentence. Triggers on "X", "Y", "Z".
---
```

The description is what every agent reads to decide whether to invoke the skill. Keep it short and trigger-rich.

## Adding a skill

1. Create `agents/skills/<name>/SKILL.md`.
2. Match an existing skill's structure.
3. Reference it from this file (table above).
4. Optionally add to the `update` skill's manifest so it propagates upstream.
