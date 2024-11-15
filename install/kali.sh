#!/bin/bash

. "$HOME/.dotfiles/install/kali/apt.sh"
. "$HOME/.dotfiles/install/arch/nodejs.sh"
. "$HOME/.dotfiles/install/common/cargo.sh"
. "$HOME/.dotfiles/install/common/nerd-fonts.sh"
# . "$HOME/.dotfiles/install/common/sfmono-font.sh"

[[ ! -d "$HOME/.nvm" ]] && mkdir "$HOME/.nvm"

ln -sfv "$HOME/.dotfiles/config/alacritty/" "${HOME}/.config/alacritty"
ln -sfv "$HOME/.dotfiles/config/xkb/" "${HOME}/.config/xkb"

sudo ln -s "$HOME/.dotfiles/config/xkb/symbols/nocustom" /usr/share/X11/xkb/symbols/nocustom
