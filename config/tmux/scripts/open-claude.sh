#!/bin/bash

tmux new-window -c '#{pane_current_path}'
tmux send-keys 'claude' C-m
