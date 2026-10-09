#!/usr/bin/env bash
# Set up filen-sync: two-way sync of Claude Code sessions and zsh history
# between machines through the Filen mount. Idempotent; safe to re-run.
#
#   ~/.dotfiles/install/common/filen-sync.sh [host-id] [--no-hooks]
#
# host-id must differ between machines (default: hostname + part of machine-id).
# --no-hooks skips editing ~/.claude/settings.json; the timer alone still syncs.
# Requires: systemd user instance, rsync, jq. Filen does not need to be
# mounted at install time; syncing is a no-op until it is.
set -euo pipefail

DOTFILES="$HOME/.dotfiles"
BIN="$HOME/.local/bin"
UNITS="${XDG_CONFIG_HOME:-$HOME/.config}/systemd/user"
CONF="${XDG_CONFIG_HOME:-$HOME/.config}/filen-sync.conf"
SETTINGS="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json"
KICK='systemctl --user start --no-block filen-sync.service'

hooks=1 host_arg=""
for a in "$@"; do
    case "$a" in
        --no-hooks) hooks=0 ;;
        *) host_arg="$a" ;;
    esac
done

if ! command -v systemctl >/dev/null || ! systemctl --user show-environment >/dev/null 2>&1; then
    echo "filen-sync: no systemd user instance, skipping" >&2
    exit 0
fi

# Script and units, symlinked from the dotfiles
mkdir -p "$BIN" "$UNITS"
ln -sfv "$DOTFILES/scripts/filen-sync" "$BIN/filen-sync"
ln -sfv "$DOTFILES/config/systemd/user/filen-sync.service" "$UNITS/filen-sync.service"
ln -sfv "$DOTFILES/config/systemd/user/filen-sync.timer" "$UNITS/filen-sync.timer"

# Host id
[ -n "$host_arg" ] && printf 'FILEN_SYNC_HOST_ID=%q\n' "$host_arg" > "$CONF"
host_id=$( { [ -f "$CONF" ] && . "$CONF"; echo "${FILEN_SYNC_HOST_ID:-$(hostname)-$(cut -c1-6 /etc/machine-id)}"; } )

# Timer
systemctl --user daemon-reload
systemctl --user enable --now filen-sync.timer

# Claude Code hooks: kick the sync service after every turn and when a session ends
if [ "$hooks" = 1 ]; then
    mkdir -p "$(dirname "$SETTINGS")"
    [ -s "$SETTINGS" ] || echo '{}' > "$SETTINGS"
    merged=$(jq --arg kick "$KICK" '
        .hooks //= {}
        | reduce ("Stop", "SessionEnd") as $ev (.;
            .hooks[$ev] //= []
            | if any(.hooks[$ev][].hooks[]?; .command == $kick) then .
              else .hooks[$ev] += [{"hooks": [{"type": "command", "command": $kick, "timeout": 10}]}] end)
    ' "$SETTINGS")
    if [ "$merged" != "$(cat "$SETTINGS")" ]; then
        cp "$SETTINGS" "$SETTINGS.pre-filen-sync.bak"
        printf '%s\n' "$merged" > "$SETTINGS.tmp" && mv -f "$SETTINGS.tmp" "$SETTINGS"
        echo "hooks added to $SETTINGS (backup: $SETTINGS.pre-filen-sync.bak)"
    else
        echo "hooks already present in $SETTINGS"
    fi
fi

echo "filen-sync installed as host '$host_id'; running first sync"
"$BIN/filen-sync" --now || true
