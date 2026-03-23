#!/usr/bin/env bash
set -euo pipefail

echo "=============================="
echo "  Monorepo Starter - Setup"
echo "=============================="
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

ok()   { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
fail() { echo -e "${RED}[FAIL]${NC} $1"; }

# Check for required tools
echo "Checking dependencies..."
echo ""

# Node/npm
if command -v node &>/dev/null; then
  ok "Node.js $(node -v)"
else
  fail "Node.js not found. Install from https://nodejs.org"
fi

# Python
if command -v python3 &>/dev/null; then
  ok "Python $(python3 --version 2>&1 | awk '{print $2}')"
else
  warn "Python3 not found. Some skills may not work."
fi

# Git
if command -v git &>/dev/null; then
  ok "Git $(git --version | awk '{print $3}')"
else
  fail "Git not found. Install git first."
  exit 1
fi

# QMD (optional but recommended)
echo ""
echo "Checking optional tools..."
if command -v qmd &>/dev/null; then
  ok "QMD installed"
else
  warn "QMD not found. Install for token-efficient markdown search:"
  echo "     npm install -g @anthropics/qmd"
  echo ""
  read -p "  Install QMD now? [y/N] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    npm install -g @anthropics/qmd && ok "QMD installed" || warn "QMD install failed"
  fi
fi

# npx / skills CLI
if command -v npx &>/dev/null; then
  ok "npx available (for skills CLI)"
else
  warn "npx not found. Install Node.js to use skills CLI."
fi

# Validate directory structure
echo ""
echo "Validating repo structure..."
MISSING=0
for f in AGENTS.md ONBOARD.md README.md knowledge/about-you.md .agents/skills/AGENTS.md; do
  if [ -f "$f" ]; then
    ok "$f"
  else
    fail "$f missing"
    MISSING=$((MISSING + 1))
  fi
done

if [ $MISSING -gt 0 ]; then
  fail "$MISSING required files missing. Check your repo."
else
  ok "All required files present"
fi

# Check if about-you.md has been filled in
echo ""
if grep -q "\[To be filled" knowledge/about-you.md 2>/dev/null; then
  warn "knowledge/about-you.md is still a template. Run onboarding to fill it in."
else
  ok "knowledge/about-you.md has been customized"
fi

echo ""
echo "=============================="
echo "  Setup complete!"
echo ""
echo "  Next steps:"
echo "  1. Open this repo in your AI coding agent"
echo "  2. Tell it: \"Run the onboarding process\""
echo "  3. The agent will read ONBOARD.md and guide you"
echo "=============================="
