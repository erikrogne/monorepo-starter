#!/usr/bin/env bash
# qmd-update — refresh the markdown search index.
#
# This is a placeholder. If you install a markdown indexing tool (e.g. `qmd`,
# `ripgrep`-based custom indexer, or a vector store), wire it in here.
# The cron framework will run this nightly once installed.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
LOG="$REPO_ROOT/memory/crons/qmd-update.log"
mkdir -p "$(dirname "$LOG")"

log() { printf "[%s] %s\n" "$(date -u +%FT%TZ)" "$*" >> "$LOG"; }

log "qmd-update start"

if command -v qmd >/dev/null 2>&1; then
  cd "$REPO_ROOT"
  qmd update >> "$LOG" 2>&1
  log "qmd update completed"
else
  log "qmd not installed — nothing to do (this cron is a no-op until you install a markdown indexer)"
fi

log "qmd-update done"
