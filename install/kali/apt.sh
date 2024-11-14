#!/bin/bash

# Install packages
apps=(
    build-essential
    zsh
    git
    vim
    fzf
    bat
    ncdu
    curl
    lsof
    whois
    traceroute
    wget
    grep
    python3
    python3-pip
    python-is-python3
    ripgrep
    alacritty
    tmux
    jq
    p7zip-full
)

sudo apt update && sudo apt install -y "${apps[@]}"

