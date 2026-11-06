#!/usr/bin/env bash
# Register the identity-leak hook for Claude Code. Idempotent; safe to re-run. Requires: jq.
set -euo pipefail

SETTINGS="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json"
HOOK="$HOME/.dotfiles/config/claude/hooks/block-identity-leak.sh"
PRIVATE="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/private"

mkdir -p "$(dirname "$SETTINGS")"
mkdir -p -m 700 "$PRIVATE"
[ -s "$SETTINGS" ] || echo '{}' > "$SETTINGS"
# Keep Claude from opening the private block list by accident
merged=$(jq --arg hook "$HOOK" --arg deny "Read(~/.claude/private/**)" '
    .permissions.deny = ((.permissions.deny // []) - ["Read(~/.dotfiles/config/claude/block-strings)", $deny] + [$deny])
    | .hooks.PreToolUse = ((.hooks.PreToolUse // []) | map(select(all(.hooks[]?; (.command // "") | endswith("/block-identity-leak.sh") | not)))
        + [{"matcher": "Bash|WebFetch|WebSearch", "hooks": [{"type": "command", "command": $hook}]}])
' "$SETTINGS")
if [ "$merged" != "$(cat "$SETTINGS")" ]; then
    cp "$SETTINGS" "$SETTINGS.pre-identity-leak-hook.bak"
    printf '%s\n' "$merged" > "$SETTINGS.tmp" && mv -f "$SETTINGS.tmp" "$SETTINGS"
    echo "Identity-leak hook added to $SETTINGS (backup: $SETTINGS.pre-identity-leak-hook.bak)"
else
    echo "Identity-leak hook already present in $SETTINGS"
fi
