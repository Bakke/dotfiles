#!/bin/bash
DEFAULT="2"
SPLITS="${1:-${DEFAULT}}"
START_COLUMNS=$(tput cols)

tmux split-window -h -c "#{pane_current_path}"  
tmux send-keys "infisical run -- docker compose up -d --remove-orphans && c exec --user root app bash" C-m
tmux send-keys C-l

if [[ ${START_COLUMNS} -ge 230 ]]; then
    tmux resize-pane -R 45
else
    tmux resize-pane -R 20
fi

tmux select-pane -t 1
tmux send-keys C-l
tmux send-keys "vim" C-m
