#!/bin/zsh
tmux split-window -h -c "#{pane_current_path}"
tmux split-window -v -c "#{pane_current_path}"
tmux resize-pane -R 24
tmux select-pane -t 1
