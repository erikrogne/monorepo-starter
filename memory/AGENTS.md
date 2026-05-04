# memory/AGENTS.md

Cross-session memory for AI agents working in this repo.

## Layout

```
memory/session-logs/
├── augment/   ← Augment Code transcripts
├── cursor/    ← Cursor agent transcripts
├── codex/     ← OpenAI Codex CLI transcripts
├── claude/    ← Claude Code transcripts
└── curated/   ← Hand-promoted snapshots from the `session` skill
```

The first four directories are populated automatically by the `session-sync` cron (see `agents/crons/session-sync/`). The `curated/` directory is for higher-signal snapshots written by the `session` skill (manual save / resume).

## How agents should use it

- **At session start:** scan the most recent files in `curated/` first, then per-agent directories if you need more context.
- **At session end:** if the user has done substantive work, suggest running the `session` skill to write a curated snapshot.
- **Cross-agent continuity:** a session started in Cursor can be resumed in Claude Code by reading the latest `curated/` snapshot.

## Privacy

Session log contents are gitignored. Only the directories themselves (with `.gitkeep`) are committed.

## What `session-sync` does

Reads transcripts from each agent's local cache (`~/.claude/`, `~/.codex/`, `~/.augment/`, `~/.cursor/`) and copies the new ones into the corresponding subdirectory here. See `agents/crons/session-sync/script.sh` for details.
