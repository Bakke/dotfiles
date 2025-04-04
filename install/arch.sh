#!/bin/bash

. "$HOME/.dotfiles/install/arch/pacman.sh"
. "$HOME/.dotfiles/install/arch/yay.sh"
. "$HOME/.dotfiles/install/common/cargo.sh"
. "$HOME/.dotfiles/install/common/nodejs.sh"
# . "$HOME/.dotfiles/install/common/vscode-php-debug.sh"
. "$HOME/.dotfiles/install/common/sfmono-font.sh"

sudo "$HOME/.dotfiles/install/arch/sddm-theme.sh"

[[ -e "$HOME/.config/hypr" ]] && rm -rf ~/.config/hypr
[[ -e "$HOME/.config/sway" ]] && rm -rf ~/.config/sway
[[ -e "$HOME/.config/i3" ]] && rm -rf ~/.config/i3

[[ ! -d "$HOME/.nvm" ]] && mkdir "$HOME/.nvm"

ln -sfv "$HOME/.dotfiles/config/waybar" "${HOME}/.config/waybar"
ln -sfv "$HOME/.dotfiles/config/hypr/" "${HOME}/.config/hypr"
ln -sfv "$HOME/.dotfiles/config/sway/" "${HOME}/.config/sway"
ln -sfv "$HOME/.dotfiles/config/i3/" "${HOME}/.config/i3"
ln -sfv "$HOME/.dotfiles/config/rofi/" "${HOME}/.config/rofi"
ln -sfv "$HOME/.dotfiles/config/xkb/" "${HOME}/.config/xkb"
ln -sfv "$HOME/.dotfiles/config/alacritty/" "${HOME}/.config/alacritty"
ln -sfv "$HOME/.dotfiles/config/mimeapps.list" "${HOME}/.config/mimeapps.list"

if [ ! $(getent group "docker") ]; then
    sudo groupadd docker
fi

sudo usermod -aG docker $USER
newgrp docker

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl enable bluetooth.service

echo "Do you want to install Composer? [y/n]"
read COMPOSER
if [ "$COMPOSER" = "y" ]; then
    . "$HOME/.dotfiles/install/common/composer.sh"
fi

echo "Do you want to install Laravel Installer? [y/n]"
read LARAVEL
if [ "$LARAVEL" = "y" ]; then
    . "$HOME/.dotfiles/install/common/laravel-installer.sh"
fi

echo "Do you want to install i3 blocklets? [y/N]"
read I3BLOCKLETS
if [ "$I3BLOCKLETS" = "y" ]; then
    . "$HOME/.dotfiles/install/common/laravel-installer.sh"
fi

echo "Do you want to install wordlists? [y/N]"
read WORDLISTS
if [ "$WORDLISTS" = "y" ]; then
    . "$HOME/.dotfiles/install/common/wordlists.sh"
fi
