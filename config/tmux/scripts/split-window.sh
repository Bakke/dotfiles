#!/bin/zsh
tmux split-window -h -c "#{pane_current_path}"
tmux split-window -v -c "#{pane_current_path}"
tmux resize-pane -R 48
tmux select-pane -t 1
tmux new-window -c "#{pane_current_path}"
tmux select-window -t 1
# tmux send-keys 'vim' C-m
