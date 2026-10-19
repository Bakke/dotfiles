#!/bin/bash

. "$HOME/.dotfiles/install/arch/pacman.sh"
. "$HOME/.dotfiles/install/arch/yay.sh"
. "$HOME/.dotfiles/install/common/nodejs.sh"
. "$HOME/.dotfiles/install/common/dotnet.sh"
# . "$HOME/.dotfiles/install/common/vscode-php-debug.sh"

link "$HOME/.dotfiles/config/waybar" "$HOME/.config/waybar"
link "$HOME/.dotfiles/config/hypr" "$HOME/.config/hypr"
link "$HOME/.dotfiles/config/sway" "$HOME/.config/sway"
link "$HOME/.dotfiles/config/i3" "$HOME/.config/i3"
link "$HOME/.dotfiles/config/rofi" "$HOME/.config/rofi"
link "$HOME/.dotfiles/config/xkb" "$HOME/.config/xkb"
link "$HOME/.dotfiles/config/sesh" "$HOME/.config/sesh"
link "$HOME/.dotfiles/config/alacritty" "$HOME/.config/alacritty"
link "$HOME/.dotfiles/config/sql-language-server" "$HOME/.config/sql-language-server"
link "$HOME/.dotfiles/config/mimeapps.list" "$HOME/.config/mimeapps.list"

if ! getent group docker > /dev/null 2>&1; then
    sudo groupadd docker
fi

sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl enable bluetooth.service

echo "Do you want to install Laravel Installer? [y/n]"
read LARAVEL
if [ "$LARAVEL" = "y" ]; then
    . "$HOME/.dotfiles/install/common/laravel-installer.sh"
fi

echo "Do you want to install i3 blocklets? [y/N]"
read I3BLOCKLETS
if [ "$I3BLOCKLETS" = "y" ]; then
    . "$HOME/.dotfiles/install/common/i3-blocklets.sh"
fi

echo "Do you want to install wordlists? [y/N]"
read WORDLISTS
if [ "$WORDLISTS" = "y" ]; then
    . "$HOME/.dotfiles/install/common/wordlists.sh"
fi

echo "Do you want to install the SDDM theme? [y/N]"
read SDDM
if [ "$SDDM" = "y" ]; then
    sudo "$HOME/.dotfiles/install/arch/sddm-theme.sh" "$HOME/.dotfiles"
fi

echo "Do you want to set up Filen sync (Claude Code sessions, zsh history)? [y/N]"
read CLAUDE_SYNC
if [ "$CLAUDE_SYNC" = "y" ]; then
    "$HOME/.dotfiles/install/common/filen-sync.sh"
fi
