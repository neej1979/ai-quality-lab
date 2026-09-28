#!/usr/bin/env bash
# Week 0 setup for ai-quality-lab. Safe to re-run: every step checks before acting.
set -euo pipefail
cd "$(dirname "$0")"

MODEL="qwen3:32b"
say()  { printf "\n\033[1m▸ %s\033[0m\n" "$1"; }
ok()   { printf "  ✓ %s\n" "$1"; }
fail() { printf "  ✗ %s\n" "$1"; exit 1; }

say "Platform"
[[ "$(uname)" == "Darwin" ]] || fail "This script targets macOS."
command -v brew >/dev/null || fail "Homebrew not found. Install from https://brew.sh, then re-run."
ok "macOS + Homebrew"

say "Node.js (20+)"
if ! command -v node >/dev/null || [[ "$(node -p 'process.versions.node.split(".")[0]')" -lt 20 ]]; then
  brew install node
fi
ok "Node $(node -v)"

say "Ollama + $MODEL"
command -v ollama >/dev/null || brew install ollama
curl -sf http://localhost:11434/api/tags >/dev/null \
  || fail "Ollama isn't running. Open the Ollama app (or run 'ollama serve' in another tab), then re-run."
ollama list | awk '{print $1}' | grep -qx "$MODEL" || ollama pull "$MODEL"
ok "Ollama running, $MODEL available"

say "gitleaks (secret guard)"
command -v gitleaks >/dev/null || brew install gitleaks
ok "gitleaks $(gitleaks version)"

say "Git repo + pre-commit hook"
[[ -d .git ]] || git init -q -b main
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit
ok "Secret guard active on every commit"

say ".env"
[[ -f .env ]] || cp .env.example .env
ok ".env present and gitignored (API keys not needed until Week 3)"

say "npm install"
npm install --silent
ok "Promptfoo installed"

say "Smoke test (local model, zero cost)"
npm run --silent smoke
ok "Week 0 environment complete. Next: SETUP.md step 3."
