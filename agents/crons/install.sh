#!/usr/bin/env bash
# install.sh — register / unregister monorepo-starter crons with launchd (macOS).
#
# Usage:
#   ./install.sh <cron-name>          # install one
#   ./install.sh all                  # install every cron in registry.json
#   ./install.sh --uninstall <name>   # remove one
#   ./install.sh --uninstall all      # remove every registered cron
#   ./install.sh --status             # show currently loaded crons

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CRONS_DIR="$REPO_ROOT/agents/crons"
REGISTRY="$CRONS_DIR/registry.json"
LAUNCH_DIR="$HOME/Library/LaunchAgents"
RENDERED_DIR="$CRONS_DIR/.rendered"

usage() { sed -n '2,12p' "${BASH_SOURCE[0]}"; exit 1; }

need_macos() {
  [[ "$(uname)" == "Darwin" ]] || { echo "This installer currently supports macOS (launchd) only." >&2; exit 1; }
}

list_cron_names() {
  python3 -c 'import json,sys; d=json.load(open(sys.argv[1])); [print(k) for k in d["crons"]]' "$REGISTRY"
}

cron_field() {
  python3 -c 'import json,sys; d=json.load(open(sys.argv[1])); print(d["crons"][sys.argv[2]].get(sys.argv[3],""))' "$REGISTRY" "$1" "$2"
}

install_one() {
  local name="$1"
  local plist_rel; plist_rel="$(cron_field "$name" macos_plist)"
  [[ -n "$plist_rel" ]] || { echo "no macos_plist for $name in registry.json"; return 1; }
  local plist_src="$CRONS_DIR/$plist_rel"
  [[ -f "$plist_src" ]] || { echo "missing $plist_src"; return 1; }
  mkdir -p "$RENDERED_DIR" "$LAUNCH_DIR" "$REPO_ROOT/memory/crons"
  local rendered="$RENDERED_DIR/$(basename "$plist_src")"
  sed "s#__REPO_ROOT__#$REPO_ROOT#g" "$plist_src" > "$rendered"
  cp "$rendered" "$LAUNCH_DIR/"
  local label; label="com.monorepo-starter.$name"
  launchctl unload "$LAUNCH_DIR/$(basename "$plist_src")" 2>/dev/null || true
  launchctl load   "$LAUNCH_DIR/$(basename "$plist_src")"
  echo "installed $label"
}

uninstall_one() {
  local name="$1"
  local plist_rel; plist_rel="$(cron_field "$name" macos_plist)"
  [[ -n "$plist_rel" ]] || return 0
  local plist_dest="$LAUNCH_DIR/$(basename "$plist_rel")"
  if [[ -f "$plist_dest" ]]; then
    launchctl unload "$plist_dest" 2>/dev/null || true
    rm -f "$plist_dest"
    echo "uninstalled com.monorepo-starter.$name"
  else
    echo "not installed: $name"
  fi
}

show_status() {
  launchctl list | awk 'NR==1 || /com\.monorepo-starter\./'
}

[[ $# -ge 1 ]] || usage
need_macos

case "$1" in
  --status) show_status ;;
  --uninstall)
    [[ $# -eq 2 ]] || usage
    if [[ "$2" == "all" ]]; then for n in $(list_cron_names); do uninstall_one "$n"; done
    else uninstall_one "$2"
    fi
    ;;
  all) for n in $(list_cron_names); do install_one "$n"; done ;;
  -h|--help) usage ;;
  *) install_one "$1" ;;
esac
