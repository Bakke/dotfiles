#!/usr/bin/env bash
fail() { echo "Blocked: identity-leak hook cannot inspect this request ($1)." >&2; exit 2; }
command -v jq > /dev/null || fail "jq not found"

input=$(cat)
cmd=$(printf '%s' "$input" | jq -r '[.tool_input.command // "", .tool_input.url // "", .tool_input.prompt // "", .tool_input.query // ""] | join(" ")') \
    || fail "unreadable hook input"

# Lowercase, percent-decode and treat '+' as space, so encoded forms compare equal
normalize() {
    local s=${1,,}
    s=${s//\\/\\\\}
    s=$(printf '%b' "${s//%/\\x}" 2>/dev/null)
    printf '%s' "${s//+/ }"
}

secrets=()
if [ -f "$HOME/.claude.json" ]; then
    acct=$(jq -r '.oauthAccount.emailAddress // empty' "$HOME/.claude.json" 2>/dev/null) || fail "unreadable ~/.claude.json"
    [ -n "$acct" ] && secrets+=("$acct")
fi
for gitmail in "$(git config --global user.email 2>/dev/null)" "$(git config user.email 2>/dev/null)"; do
    [ -n "$gitmail" ] && secrets+=("$gitmail")
done
# Private extra strings, one per line; synced by filen-sync
extra="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/private/block-strings"
if [ -e "$extra" ]; then
    [ -r "$extra" ] || fail "unreadable $extra"
    while IFS= read -r s || [ -n "$s" ]; do
        s="${s#"${s%%[![:space:]]*}"}"
        s="${s%"${s##*[![:space:]]}"}"
        [ -n "$s" ] && secrets+=("$s")
    done < "$extra"
fi

raw=${cmd,,}
decoded=$(normalize "$cmd")
for s in "${secrets[@]}"; do
    if [[ "$raw" == *"${s,,}"* || "$decoded" == *"$(normalize "$s")"* ]]; then
        echo "Blocked: this request contains a personal identifier. Use a generic User-Agent or skip the site." >&2
        exit 2
    fi
done
exit 0
