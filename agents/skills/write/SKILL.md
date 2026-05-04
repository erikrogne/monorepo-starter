---
name: write
description: Draft documents in the user's voice. Templates for PRD, one-pager, status update, brief, spec. Use when the user says "write a PRD", "draft a one-pager", "write up this spec", "draft a status update", or any document-creation request.
---

# write

Drafts documents in the user's voice using a template-driven approach. Output should sound like the user wrote it, not like an AI assisted them.

## When to use

- "Write a PRD for X."
- "Draft a one-pager about Y."
- "Write a status update for last week."
- "Turn this into a spec."
- "Write me a brief on Z."

If the user just says "write something" without context, ask what kind of document and what topic.

## Steps

### 1. Read identity and voice

Always read `identity/about-you.md` and `identity/voice-guide.md` first. Anything they say about tone, length, structure, or banned phrases is non-negotiable.

### 2. Pick the template

Templates live in `templates/`:

| Template | Use for |
|----------|---------|
| `prd.md` | Product requirement docs. Defines problem, users, scope, success metrics. |
| `one-pager.md` | Executive alignment docs. Prose, not bullets. |
| `status-update.md` | What shipped, what's blocked, what's next. |
| `brief.md` | Background + recommendation, ~1 page. |
| `spec.md` | Engineering or design spec. Concrete and verifiable. |

If none fit, ask the user which is closest, then adapt. Don't invent a new template silently.

### 3. Gather context

Before drafting, look for context already in the repo:
- Active project? Read `projects/<name>/`.
- Topic mentioned? Search `wiki/` for prior thinking.
- People mentioned? Read `wiki/people/<name>.md` for context.
- Connected MCPs? Pull relevant references (don't dump — cite the top 1–3).

If the user expects context you don't have, ask before drafting.

### 4. Draft

Fill the template. Apply the voice guide. Specifically:
- Match the user's typical length unless they said otherwise.
- Avoid banned words/phrases from `voice-guide.md`.
- Use the user's preferred structure (bullets vs prose, headings vs flat).
- Cite sources inline when the doc benefits from them.

### 5. Show + iterate

Show the draft. Ask one targeted question if the user might want to revise:
- "Want me to push on the success metrics?"
- "Should I add the trade-offs section?"
- "Length feels off — want shorter or longer?"

Don't ask three questions. Ask one.

### 6. Save

Once approved, save to a sensible path. Default:
- Project doc → `projects/<name>/<doc-type>.md`.
- Cross-project → ask the user where it belongs.

## Notes

- "In the user's voice" means: matches their voice guide, sounds like them, doesn't read as AI output. If the draft has obvious AI tells (em dashes everywhere, "delve", "leverage as a verb", balanced parallelism, vague hedging), rewrite.
- Prose over bullets unless the user prefers bullets.
- Don't pad. Length should fit the content, not a target word count.
