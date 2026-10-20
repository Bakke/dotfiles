#!/bin/bash

. "$HOME/.dotfiles/install/common/apt.sh"

sudo apt update
sudo apt install -y "${apps[@]}"

ln -sfn "$(command -v fdfind)" "$HOME/.local/bin/fd"
ln -sfn "$(command -v batcat)" "$HOME/.local/bin/bat"
