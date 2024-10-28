#!/bin/bash

if [ "$(hyprctl activewindow -j | jq -r ".class")" = "CiscoCollabHost" ]; then
    kill $(hyprctl activewindow | grep pid | tail -1 | awk '{print$2}')
else
    hyprctl dispatch killactive ""
fi
