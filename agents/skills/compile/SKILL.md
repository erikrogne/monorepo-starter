---
name: compile
description: Synthesize raw inputs (meetings, notes) into wiki entries. Use when the user says "compile this", "extract from", "turn this into a wiki entry", or after a new file lands in raw/.
---

# compile

The one-way bridge from `raw/` (immutable inputs) to `wiki/` (compiled knowledge). Reads source material, extracts decisions / concepts / people / action items, and writes them into the appropriate wiki subdirectory.

## When to use

- User says "compile this meeting", "extract decisions from", "turn this into wiki entries".
- A new file just landed in `raw/meetings/` or `raw/notes/`.
- User says "compile what I learned this week" → batch over recent raw files.

## Steps

### 1. Identify the source

Confirm what to compile. Either:
- A specific file path the user provided.
- The most recent N files in `raw/` if they said "compile this week".
- A directory if they said "compile all of `raw/meetings/`".

### 2. Extract by category

Read the source(s). For each, identify:

- **Decisions** — anything decided, with context, options considered, choice, rationale.
- **People** — anyone mentioned with substantive context (a name in passing doesn't count).
- **Concepts** — frameworks, ideas, or topics worth their own entry.
- **Action items** — things the user owes someone or someone owes the user.
- **Open questions** — unresolved threads worth tracking.

### 3. Write to wiki

For each extracted item, write to the right surface:

| Item | Path |
|------|------|
| Decision | `wiki/decisions/YYYY-MM-DD-<slug>.md` |
| Person profile (new) | `wiki/people/<first-last>.md` |
| Person profile (update) | append to existing file under "Recent context" |
| Concept | `wiki/concepts/<slug>.md` |
| Summary (cross-cutting) | `wiki/summaries/YYYY-MM-DD-<slug>.md` |

Cite the source. Use a relative link to the `raw/` file, or an Obsidian-style `[[wikilink]]` if the user prefers.

### 4. Action items and open questions

These don't go in wiki — they belong with the project they relate to:

- If the action item is about a project, append to `projects/<name>/notes.md` under an "Action items" heading.
- If it's a general open question, append to `wiki/summaries/_open-questions.md` (create if missing).

### 5. Summarize

Tell the user what you wrote:
- N decisions added.
- M people updated, K new.
- L concepts.
- A action items, Q open questions.

List the files with paths so they can review.

## Notes

- **Never modify `raw/`.** The compile skill is read-only on raw.
- If a wiki entry already exists for a concept or person, **append to it**, don't replace.
- Use frontmatter on new entries: `title`, `tags`, `updated`, `sources` (array of raw file paths).
- The user's `voice-guide.md` applies to summaries and any prose in wiki entries.
