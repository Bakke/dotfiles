#!/bin/bash

. "$HOME/.dotfiles/install/kali/apt.sh"

if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    mkdir -p "$HOME/.nvm"
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | NVM_DIR="$HOME/.nvm" PROFILE=/dev/null bash
fi

. "$HOME/.dotfiles/install/common/nodejs.sh"
. "$HOME/.dotfiles/install/common/nerd-fonts.sh"

link "$HOME/.dotfiles/config/alacritty" "$HOME/.config/alacritty"
link "$HOME/.dotfiles/config/xkb" "$HOME/.config/xkb"

sudo ln -sfn "$HOME/.dotfiles/config/xkb/symbols/nocustom" /usr/share/X11/xkb/symbols/nocustom
