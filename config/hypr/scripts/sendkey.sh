#!/bin/sh

mainBind=$1
altBind=$2
altApplication=$3
activeWindowClass=$(hyprctl activewindow -j | jq -r ".class")
activeWindowAddress=$(hyprctl activewindow -j | jq -r ".address")

if [ "${activeWindowClass}" != "${altApplication}" ]; then
    hyprctl dispatch sendshortcut "${mainBind}, address:${activeWindowAddress}"
else 
    hyprctl dispatch sendshortcut "${altBind}, address:${activeWindowAddress}"
fi
