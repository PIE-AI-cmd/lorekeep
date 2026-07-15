#!/usr/bin/env bash
# Lorekeep SessionEnd hook: capture a session stub to raw only.
# CRITICAL: writes only under <vault>/raw/. Never wiki, never CLAUDE.md, never canon.
# Local only: nothing leaves the machine. Promotion to canon is always a manual rewrite.
set -euo pipefail

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
RAW_DIR="$VAULT/raw/sessions"

# Path guard: refuse to run unless the target is confined to raw/sessions.
case "$RAW_DIR" in
  */raw/sessions) : ;;
  *) echo "Lorekeep: refusing to write outside raw/. Aborting capture." >&2; exit 0 ;;
esac

mkdir -p "$RAW_DIR"
STAMP="$(date -u +%Y-%m-%dT%H-%M-%SZ)"
OUT="$RAW_DIR/$STAMP-session-capture.md"

# Read the hook payload from stdin if present. Store verbatim, no interpretation.
PAYLOAD="$(cat || true)"

{
  echo "---"
  echo "type: raw-capture"
  echo "captured: $STAMP"
  echo "source: lorekeep SessionEnd hook"
  echo "processed: false"
  echo "---"
  echo
  echo "# Session capture $STAMP"
  echo
  echo "Unprocessed. Lands in raw only. Promote through the governed gate, never automatically."
  if [ -n "$PAYLOAD" ]; then
    echo
    echo "## Hook payload"
    echo '```json'
    echo "$PAYLOAD"
    echo '```'
  fi
} > "$OUT"

echo "Lorekeep: captured session to $OUT (raw only)."
exit 0
