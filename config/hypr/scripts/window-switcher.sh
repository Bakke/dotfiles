#!/bin/bash
# Alt+Tab window switcher. Usage: window-switcher.sh [workspace|all] [next|prev]
# Expects to be started inside the "switcher" submap, which it resets on exit.

trap 'hyprctl dispatch "hl.dsp.submap(\"reset\")" >/dev/null' EXIT

scope=${1:-workspace}
direction=${2:-next}

if [[ $scope == all ]]; then
    filter='true'
    label='"[\(.workspace.name)] \(.title)"'
    prompt="All windows"
else
    filter=".workspace.id == $(hyprctl activeworkspace -j | jq '.id')"
    label='.title'
    prompt="Windows"
fi

clients=$(hyprctl clients -j | jq "[.[] | select(.mapped and $filter)] | sort_by(.focusHistoryID)")

count=$(jq 'length' <<< "$clients")
(( count < 2 )) && exit 0

# Most recent window first, so one Tab selects the previous window
[[ $direction == prev ]] && row=$(( count - 1 )) || row=1

index=$(jq -j ".[] | \"\(${label})\u0000icon\u001f\(.class)\n\"" <<< "$clients" | rofi -dmenu -i -no-custom \
    -p "$prompt" -format i -selected-row "$row" \
    -kb-row-down "Alt+Tab,Super+Tab,Down,Control+n" \
    -kb-row-up "Alt+ISO_Left_Tab,Alt+Shift+Tab,Super+ISO_Left_Tab,Super+Shift+Tab,Up,Control+p" \
    -kb-accept-entry "!Alt_L,!Alt+Alt_L,!Super_L,!Super+Super_L,Return,KP_Enter")

[[ -z $index ]] && exit 0

address=$(jq -r --argjson i "$index" '.[$i].address' <<< "$clients")
hyprctl dispatch "hl.dsp.focus({ window = \"address:$address\" })" >/dev/null
