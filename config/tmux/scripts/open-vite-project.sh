#!/bin/bash
DEFAULT="2"
SPLITS="${1:-${DEFAULT}}"
START_COLUMNS=$(tput cols)
PROJECT_DIR=$(pwd)

tmux split-window -h -c "#{pane_current_path}" 
tmux send-keys C-l
tmux split-window -v -c "#{pane_current_path}" "cd ${PROJECT_DIR} && yarn dev"
tmux send-keys C-l
tmux resize-pane -D 18

if [[ ${START_COLUMNS} -ge 230 ]]; then
    tmux resize-pane -R 45
else
    tmux resize-pane -R 20
fi

tmux select-pane -t 1
tmux send-keys C-l
tmux send-keys "vim" C-m
