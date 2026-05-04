# raw/AGENTS.md

Immutable source data. **AI agents read from here but never write to it.**

## Layout

```
raw/
├── meetings/   ← meeting transcripts, notes, recordings metadata
└── notes/      ← captured thoughts, snippets, web clips
```

Add subdirectories as needed (`raw/email/`, `raw/slack/`, `raw/screenshots/`) — they should be append-only stores fed by sync scripts or manual drops.

## The immutability rule

Agents must treat `raw/` as read-only. The `compile` skill is the one-way bridge: it reads from `raw/`, synthesizes, and writes to `wiki/`. If you need to "fix" something in `raw/`, fix the synthesis in `wiki/` instead — keep the raw record untouched.

## Filename conventions

- Date-prefix everything: `2026-05-04-meeting-with-x.md`.
- Use kebab-case.
- Include the source in the filename when ambiguous: `2026-05-04-granola-customer-call.md`.

## What goes here vs. wiki

| In `raw/` | In `wiki/` |
|-----------|-----------|
| The transcript of a meeting | The decisions / action items extracted from it |
| A web clip you saved | A concept page that cites it |
| A voice memo transcription | A topic summary that pulls from many memos |

If you find yourself wanting to edit `raw/`, you actually want to write a new entry in `wiki/`.
