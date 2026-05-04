# wiki/AGENTS.md

AI-compiled knowledge. The output of synthesis from `raw/`, projects, and memory.

## Layout

```
wiki/
├── concepts/    ← topics, frameworks, mental models
├── decisions/   ← decisions made (across projects), with rationale
├── people/      ← profiles of people you interact with
└── summaries/   ← longer-form recaps (weekly, monthly, project post-mortems)
```

Add subdirectories as your knowledge grows (`wiki/tools/`, `wiki/companies/`, `wiki/patterns/`).

## Who writes here

Agents write here, primarily through the `compile` skill. The user may also edit by hand. Both are fine — the wiki is your second brain, not a database.

## Format

- One concept per file. Use kebab-case filenames.
- Frontmatter is optional but useful: `title`, `tags`, `updated`, `sources`.
- Cite sources. Link `raw/` files with relative paths or `[[wikilinks]]` if you prefer Obsidian-style.

## Decisions

Decisions deserve a consistent shape:

```markdown
# Decision — <short title>

**Date:** YYYY-MM-DD
**Context:** what prompted this
**Options considered:** brief list
**Choice:** what you decided
**Rationale:** why
**Sources:** [[raw/meetings/...]]
```

## People

People profiles in `wiki/people/<first-last>.md`:

```markdown
# Name

**Role:** ...
**How we know them:** ...
**Recent context:** last 2-3 interactions
**Notes:** preferences, sensitivities, things to remember
```

## Maintenance

The `compile` skill is the primary writer. Run it when:
- A new meeting transcript lands in `raw/meetings/`.
- You finish a substantive piece of project work.
- You explicitly ask "compile what I learned this week."
