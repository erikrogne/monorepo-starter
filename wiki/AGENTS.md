# Wiki — AI-Compiled Knowledge

> Processed knowledge compiled from raw data. Agents own this directory.

---

## Contents

- [[concepts/AGENTS|Concepts]] — Ideas, frameworks, mental models
- [[decisions/AGENTS|Decisions]] — Decision records with context
- [[people/AGENTS|People]] — Personal CRM, relationship context
- [[summaries/AGENTS|Summaries]] — Synthesized source material

---

## The Compilation Pattern

```
raw/ (immutable) → wiki/ (compiled)
```

Agents read from `raw/` and write structured knowledge here:
- Extract insights from meetings
- Synthesize themes from notes
- Build relationship context from interactions
- Create decision records from discussions

---

## Writing to Wiki

When adding to wiki:

1. **Link to sources** — Reference the raw file that informed this
2. **Add timestamps** — When was this compiled/updated
3. **Use wikilinks** — Connect related concepts with `[[links]]`
4. **Keep atomic** — One idea per file when possible

---

## For Agents

- This is your primary write destination
- Compile raw data into structured knowledge
- Maintain connections between concepts
- Update existing entries as new info arrives
- Follow the subfolder conventions
