#!/bin/bash
# Alt+Tab window switcher for the active workspace. Usage: window-switcher.sh [next|prev]
# Expects to be started inside the "switcher" submap, which it resets on exit.

trap 'hyprctl dispatch "hl.dsp.submap(\"reset\")" >/dev/null' EXIT

workspace=$(hyprctl activeworkspace -j | jq '.id')
clients=$(hyprctl clients -j | jq --argjson ws "$workspace" \
    '[.[] | select(.mapped and .workspace.id == $ws)] | sort_by(.focusHistoryID)')

count=$(jq 'length' <<< "$clients")
(( count < 2 )) && exit 0

# Most recent window first, so one Tab selects the previous window
[[ $1 == prev ]] && row=$(( count - 1 )) || row=1

index=$(jq -j '.[] | "\(.title)\u0000icon\u001f\(.class)\n"' <<< "$clients" | rofi -dmenu -i -no-custom \
    -p "Windows" -format i -selected-row "$row" \
    -kb-row-down "Alt+Tab,Down,Control+n" \
    -kb-row-up "Alt+ISO_Left_Tab,Alt+Shift+Tab,Up,Control+p" \
    -kb-accept-entry "!Alt_L,!Alt+Alt_L,Return,KP_Enter")

[[ -z $index ]] && exit 0

address=$(jq -r --argjson i "$index" '.[$i].address' <<< "$clients")
hyprctl dispatch "hl.dsp.focus({ window = \"address:$address\" })" >/dev/null
