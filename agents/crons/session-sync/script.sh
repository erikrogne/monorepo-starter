#!/usr/bin/env bash
# session-sync — copy AI agent session transcripts into memory/session-logs/
#
# Idempotent: only copies files that don't already exist in the destination.
# Each agent stores transcripts somewhere different. Adjust the SOURCES below
# to match what's actually on your machine.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
DEST_BASE="$REPO_ROOT/memory/session-logs"
LOG="$REPO_ROOT/memory/crons/session-sync.log"
mkdir -p "$(dirname "$LOG")"

log() { printf "[%s] %s\n" "$(date -u +%FT%TZ)" "$*" >> "$LOG"; }

sync_dir() {
  local label="$1" src="$2" dest="$3" pattern="$4"
  [[ -d "$src" ]] || { log "$label: source $src missing, skip"; return 0; }
  mkdir -p "$dest"
  local count=0
  while IFS= read -r -d '' f; do
    local base; base="$(basename "$f")"
    if [[ ! -e "$dest/$base" ]]; then
      cp "$f" "$dest/$base"
      count=$((count+1))
    fi
  done < <(find "$src" -type f -name "$pattern" -print0 2>/dev/null)
  log "$label: $count new file(s)"
}

log "session-sync start"

# Claude Code — historical conversations live under ~/.claude/projects/
sync_dir "claude" "$HOME/.claude/projects" "$DEST_BASE/claude" "*.jsonl"

# Codex CLI — sessions live under ~/.codex/sessions/
sync_dir "codex"  "$HOME/.codex/sessions"  "$DEST_BASE/codex"  "*.json"

# Augment — VS Code extension stores history under ~/.augment/
sync_dir "augment" "$HOME/.augment/sessions" "$DEST_BASE/augment" "*.json"

# Cursor — workspace storage; user may need to point this elsewhere
sync_dir "cursor" "$HOME/Library/Application Support/Cursor/User/workspaceStorage" "$DEST_BASE/cursor" "*.json"

log "session-sync done"
