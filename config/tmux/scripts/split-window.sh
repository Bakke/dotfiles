#!/bin/zsh
tmux split-window -h -c "#{pane_current_path}"
tmux send-keys C-i
tmux split-window -v -c "#{pane_current_path}"
tmux send-keys C-i
tmux resize-pane -R 35
tmux select-pane -t 1
tmux new-window -c "#{pane_current_path}"
tmux send-keys C-i
tmux select-window -t 1
# tmux send-keys 'vim' C-m
