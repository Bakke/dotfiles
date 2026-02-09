#!/bin/bash
DEFAULT="2"
SPLITS="${1:-${DEFAULT}}"
START_COLUMNS=$(tput cols)

tmux split-window -h -c "#{pane_current_path}"
tmux send-keys C-l

# if [[ "${SPLITS}" == "${DEFAULT}" ]]; then
#     tmux split-window -v -c "#{pane_current_path}"
#     tmux send-keys C-l
# fi

if [[ ${START_COLUMNS} -ge 230 ]]; then
    tmux resize-pane -R 45
else
    tmux resize-pane -R 20
fi

tmux select-pane -t 1
tmux send-keys C-l
