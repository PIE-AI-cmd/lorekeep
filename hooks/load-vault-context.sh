#!/usr/bin/env bash
# Lorekeep SessionStart hook: load vault context, read only.
# Emits the vault index so the agent starts index first. Never writes anything.
# Local only: nothing leaves the machine.
set -euo pipefail

# Find the vault root. Priority: LOREKEEP_VAULT env, then walk up for CLAUDE.md, then cwd.
find_vault_root() {
  if [ -n "${LOREKEEP_VAULT:-}" ] && [ -d "$LOREKEEP_VAULT" ]; then
    printf '%s\n' "$LOREKEEP_VAULT"
    return 0
  fi
  local dir
  dir="$(pwd)"
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/CLAUDE.md" ]; then
      printf '%s\n' "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  printf '%s\n' "$(pwd)"
}

VAULT="$(find_vault_root)"

# Read only. Emit the index if present so retrieval is index first.
if [ -f "$VAULT/wiki/index.md" ]; then
  echo "Lorekeep: vault at $VAULT. Read wiki/index.md first, open only what it points to. Cite raw sources, not derived pages."
  echo "----- wiki/index.md -----"
  cat "$VAULT/wiki/index.md"
elif [ -f "$VAULT/CLAUDE.md" ]; then
  echo "Lorekeep: constitution found at $VAULT/CLAUDE.md but no wiki/index.md. Run the onboard skill to finish setup, or scaffold to build the vault tree."
else
  echo "Lorekeep: first run, no vault found here. Run the onboard skill to get set up and learn the user. Say \"onboard me\" or \"get started\"."
fi

exit 0
