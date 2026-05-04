# agents/cli/AGENTS.md

Reference notes for any custom CLI tools you wire into this system.

This directory is intentionally empty in the starter. As you accumulate tools (e.g., a markdown search CLI, a transcript transcription helper, a deck generator), document them here so AI agents discover and use them rather than reinventing.

## Suggested format per tool

Create one markdown file per tool, e.g. `qmd.md`:

```markdown
# qmd — markdown search

**Install:** `bun add -g @your-org/qmd`
**Usage:**
- `qmd search "term"`           # keyword
- `qmd vsearch "concept"`       # semantic
- `qmd query "question"`        # hybrid + rerank

**When to use:** Searching markdown vaults (notes, wiki). Faster than grep+read.
**Cron:** `agents/crons/qmd-update` refreshes the index nightly.
```

That's enough for any agent to pick up the tool the next time it's relevant.
