---
name: session
description: Save or resume working state across sessions. Use when the user says "save my session", "resume", "where was I", "pick up where I left off", or at the natural end of a substantive work block.
---

# session

Cross-session memory. Two modes: **save** writes a curated snapshot; **resume** reads the latest one.

## When to use

- User says "save my session", "checkpoint this", "I'm done for now".
- User says "resume", "where was I", "what was I working on", "pick up where we left off".
- Start of a new session if `memory/session-logs/curated/` has a recent file (read the latest as part of context).
- End of a session with non-trivial work — proactively suggest saving.

## Save mode

### 1. Identify what's worth saving

Reread the conversation. Capture:
- What the user was working on (one line).
- Decisions made or pivots taken.
- Open questions or unresolved threads.
- Files touched (with paths).
- The next concrete step.

### 2. Write the snapshot

Path: `memory/session-logs/curated/YYYY-MM-DD-HHMM-<slug>.md`

Format:

```markdown
# Session — <one-line summary>

**When:** <ISO timestamp>
**Agent:** claude-code | codex | augment | cursor
**Project:** <project dir if applicable>

## What we did
- ...

## Decisions
- ...

## Open threads
- ...

## Files touched
- `path/to/file` — what changed

## Next step
<concrete first action for the next session>
```

### 3. Confirm

Show the path. Tell the user they can resume by saying "resume".

## Resume mode

### 1. Find the latest snapshot

List `memory/session-logs/curated/`, sort by filename (which is timestamped), pick the most recent.

If there are also fresh per-agent transcripts in `memory/session-logs/{augment,cursor,codex,claude}/` from today, scan those for additional context.

### 2. Restore context

Read the snapshot. Summarize for the user:
- What you were doing.
- Where you left off.
- The next step.

### 3. Confirm direction

Ask: "Continue with `<next step>`, or pivot?"

## Notes

- Filenames are timestamped so plain `ls -1 | tail -1` always finds the latest.
- The `curated/` directory is the only one written by this skill. Per-agent directories are populated by the `session-sync` cron.
- If `memory/session-logs/curated/` is empty on a "resume" call, fall back to the per-agent transcripts. If those are also empty, tell the user there's no prior state to resume from.
