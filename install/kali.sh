#!/bin/bash

. "$HOME/.dotfiles/install/kali/apt.sh"
. "$HOME/.dotfiles/install/arch/nodejs.sh"
. "$HOME/.dotfiles/install/arch/cargo.sh"
. "$HOME/.dotfiles/install/arch/sfmono-font.sh"

[[ ! -d "$HOME/.nvm" ]] && mkdir "$HOME/.nvm"

ln -sfv "$HOME/.dotfiles/config/alacritty/.alacritty.toml" ~/.alacritty.toml
