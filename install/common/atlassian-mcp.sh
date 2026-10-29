#!/usr/bin/env bash
# Set up the Atlassian Rovo MCP server for Claude Code (Bitbucket PRs and pipelines).
# Idempotent; safe to re-run. The API token lives in the keyring, see
# scripts/atlassian-mcp-headers. Requires: claude, jq, secret-tool.
set -euo pipefail

DOTFILES="$HOME/.dotfiles"
BIN="$HOME/.local/bin"
SETTINGS="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json"
HOOK="$DOTFILES/config/claude/hooks/atlassian-write-allowlist"

mkdir -p "$BIN"
ln -sfv "$DOTFILES/scripts/atlassian-mcp-headers" "$BIN/atlassian-mcp-headers"

claude mcp get atlassian > /dev/null 2>&1 \
    || claude mcp add-json --scope user atlassian \
        '{"type":"http","url":"https://mcp.atlassian.com/v2/mcp","headersHelper":"atlassian-mcp-headers"}'

# Never merge or delete through MCP; writes go through the allowlist hook
mkdir -p "$(dirname "$SETTINGS")"
[ -s "$SETTINGS" ] || echo '{}' > "$SETTINGS"
merged=$(jq --arg hook "$HOOK" '
    .permissions.deny = ((.permissions.deny // []) - ["mcp__atlassian__executeDestructive"] + ["mcp__atlassian__executeDestructive"])
    | .hooks.PreToolUse = ((.hooks.PreToolUse // []) | map(select(all(.hooks[]?; .command != $hook)))
        + [{"matcher": "mcp__atlassian__execute|mcp__atlassian__executeWrite", "hooks": [{"type": "command", "command": $hook}]}])
' "$SETTINGS")
if [ "$merged" != "$(cat "$SETTINGS")" ]; then
    cp "$SETTINGS" "$SETTINGS.pre-atlassian-mcp.bak"
    printf '%s\n' "$merged" > "$SETTINGS.tmp" && mv -f "$SETTINGS.tmp" "$SETTINGS"
    echo "Atlassian MCP rules added to $SETTINGS (backup: $SETTINGS.pre-atlassian-mcp.bak)"
else
    echo "Atlassian MCP rules already present in $SETTINGS"
fi
