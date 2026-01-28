#!/bin/bash

DEFAULT="3"
SPLITS="${1:-${DEFAULT}}"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "${CURRENT_DIR}/split-window.sh" "${SPLITS}"
tmux send-keys 'vim' C-m
