#!/bin/bash

. "$HOME/.dotfiles/install/arch/pacman.sh"
. "$HOME/.dotfiles/install/arch/nodejs.sh"
. "$HOME/.dotfiles/install/arch/yay.sh"
. "$HOME/.dotfiles/install/arch/cargo.sh"
. "$HOME/.dotfiles/install/arch/themes.sh"
. "$HOME/.dotfiles/install/arch/icons.sh"
. "$HOME/.dotfiles/install/arch/sfmono-font.sh"

sudo "$HOME/.dotfiles/install/arch/sddm-theme.sh"

[[ -e "$HOME/.config/hypr" ]] && rm -rf ~/.config/hypr
[[ -e "$HOME/.config/sway" ]] && rm -rf ~/.config/sway

[[ ! -d "$HOME/.nvm" ]] && mkdir "$HOME/.nvm"
[[ ! -d "$HOME/.config/beekeeper-studio" ]] && mkdir "$HOME/.config/beekeeper-studio"

ln -sfv "$HOME/.dotfiles/config/waybar" "${HOME}/.config/waybar"
ln -sfv "$HOME/.dotfiles/config/hypr/" "${HOME}/.config/hypr"
ln -sfv "$HOME/.dotfiles/config/sway/" "${HOME}/.config/sway"
ln -sfv "$HOME/.dotfiles/config/rofi/" "${HOME}/.config/rofi"
ln -sfv "$HOME/.dotfiles/config/xkb/" "${HOME}/.config/xkb"
ln -sfv "$HOME/.dotfiles/config/mimeapps.list" "${HOME}/.config/mimeapps.list"
ln -sfv "$HOME/.dotfiles/config/kitty/" ~/.config/kitty
ln -sfv "$HOME/.dotfiles/config/alacritty/.alacritty.toml" ~/.alacritty.toml
ln -sfv "$HOME/.dotfiles/config/beekeeper-studio/.beekeeper.vimrc" ~/.config/beekeeper-studio/.beekeeper.vimrc

if [ ! $(getent group "docker") ]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
fi

sudo ln -sfv "$HOME/.dotfiles/etc/logid.cfg" /etc/

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable logid.service

# sudo g810-led -p /etc/g810-led/profile

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
