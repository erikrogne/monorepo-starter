#!/usr/bin/env bash
# monorepo-starter bootstrap
#
# Verifies prerequisites and prints the next-step guidance. Idempotent —
# safe to re-run. The heavier MCP wizard lives in the `setup` skill, which
# any AI agent can invoke once the plugin is installed.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

bold()  { printf "\033[1m%s\033[0m\n" "$*"; }
green() { printf "\033[32m%s\033[0m\n" "$*"; }
yellow(){ printf "\033[33m%s\033[0m\n" "$*"; }
red()   { printf "\033[31m%s\033[0m\n" "$*"; }

bold "monorepo-starter setup"
echo ""

# 1. Required tools -----------------------------------------------------------
echo "Checking prerequisites..."
MISSING=()
command -v git  >/dev/null 2>&1 || MISSING+=("git")
command -v node >/dev/null 2>&1 || MISSING+=("node")
command -v npx  >/dev/null 2>&1 || MISSING+=("npx")

if [[ ${#MISSING[@]} -gt 0 ]]; then
  red "Missing: ${MISSING[*]}"
  echo "Install Node.js (which includes npx) from https://nodejs.org and re-run."
  exit 1
fi
green "  git, node, npx ✓"

# 2. uv (used by some MCP servers like mcp-atlassian via uvx) -----------------
if ! command -v uv >/dev/null 2>&1; then
  yellow "  uv not found — installing (used by uvx-based MCP servers)..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  # shellcheck disable=SC1091
  if [[ -f "$HOME/.local/bin/env" ]]; then source "$HOME/.local/bin/env"; fi
fi
if command -v uv >/dev/null 2>&1; then
  green "  uv ✓"
else
  yellow "  uv install skipped — add ~/.local/bin to PATH if you want uvx-based MCPs"
fi

# 3. Local directory state ----------------------------------------------------
echo ""
echo "Verifying directories..."
for d in agents memory raw wiki projects identity; do
  if [[ ! -d "$d" ]]; then
    red "  missing $d/"; exit 1
  fi
done
green "  agents, memory, raw, wiki, projects, identity ✓"

# 4. Next steps ---------------------------------------------------------------
echo ""
bold "Next:"
cat <<'NEXT'

  1. Open this directory in your AI agent (Claude Code, Codex, Augment, or Cursor).
  2. Ask the agent: "run the setup skill"
       It will walk you through:
         - identity (about-you, voice-guide)
         - MCP integrations (pick from a menu — only what you need)
         - optional crons (session-sync, qmd-update)
  3. Then ask: "run onboard"  → fills in your initial about-you context.
  4. Then anytime: "save my session" or "resume" → cross-session memory.

  Files of interest:
    AGENTS.md            top-level protocol every AI agent reads first
    .mcp.json            day-1 MCP config (no creds)
    .mcp.template.json   menu of integrations the setup skill installs on demand
    agents/skills/       skill registry (setup, onboard, session, write, ...)
    memory/session-logs/ where session-sync deposits AI agent transcripts

NEXT

green "Done."
