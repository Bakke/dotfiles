#!/bin/bash

DEFAULT="3"
SPLITS="${1:-${DEFAULT}}"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# . ~/.dotfiles/config/tmux/scripts/split-window.sh "${SPLITS}"
. "${CURRENT_DIR}/split-window.sh" "${SPLITS}"
tmux send-keys 'vim' C-m
