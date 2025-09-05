#!/bin/bash
DEFAULT="3"
SPLITS="${1:-3}"

tmux split-window -h -c "#{pane_current_path}"
tmux send-keys C-l

if [[ "${SPLITS}" == "${DEFAULT}" ]]; then
    tmux split-window -v -c "#{pane_current_path}"
    tmux send-keys C-l
    # tmux resize-pane -R 35
fi

tmux resize-pane -R 30
tmux select-pane -t 1
tmux send-keys C-l
