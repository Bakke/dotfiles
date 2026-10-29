#!/bin/bash

# Answers are saved per machine; rerun with --ask to answer again
ANSWERS="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles-install.conf"

if [ "$ASK_ALL" = 1 ]; then
    rm -f "$ANSWERS"
elif [ -f "$ANSWERS" ]; then
    . "$ANSWERS"
fi

ask() {
    [ -n "${!2:-}" ] && return
    printf '%s [y/N] ' "$1"
    read -r REPLY
    case $REPLY in
        y|Y) REPLY=y ;;
        *) REPLY=n ;;
    esac
    printf -v "$2" '%s' "$REPLY"
    echo "$2=$REPLY" >> "$ANSWERS"
}

ask "Full install (desktop apps, keyring, extra AUR packages)?" FULL_INSTALL
ask "Install Hyprland apps?" HYPR
ask "Install Sway apps?" SWAY
ask "Install i3 apps?" I3
ask "Install i3 blocklets?" I3BLOCKLETS
ask "Install pentest tools?" PENTEST
ask "Install wordlists?" WORDLISTS
ask "Install Laravel installer?" LARAVEL
ask "Install the SDDM theme?" SDDM
ask "Set up Filen sync (Claude Code sessions, zsh history)?" CLAUDE_SYNC

. "$HOME/.dotfiles/install/arch/pacman.sh"
. "$HOME/.dotfiles/install/arch/yay.sh"

# filen-desktop-bin links rclone one directory above where the app looks for it
if [ -d /usr/lib/filen-desktop ]; then
    sudo mkdir -p /usr/lib/filen-desktop/app.asar.unpacked/bin/rclone
    sudo ln -sfn /usr/bin/rclone /usr/lib/filen-desktop/app.asar.unpacked/bin/rclone/rclone-linux-amd64
fi

. "$HOME/.dotfiles/install/common/nodejs.sh"
. "$HOME/.dotfiles/install/common/dotnet.sh"

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

if [ "$FULL_INSTALL" = "y" ]; then
    sudo ln -sfn "$HOME/.dotfiles/config/keyd/k4.conf" /etc/keyd/k4.conf
    sudo systemctl enable keyd.service
    "$HOME/.dotfiles/install/common/atlassian-mcp.sh"
fi

if [ "$LARAVEL" = "y" ]; then
    . "$HOME/.dotfiles/install/common/laravel-installer.sh"
fi

if [ "$I3BLOCKLETS" = "y" ]; then
    . "$HOME/.dotfiles/install/common/i3-blocklets.sh"
fi

if [ "$WORDLISTS" = "y" ]; then
    . "$HOME/.dotfiles/install/common/wordlists.sh"
fi

if [ "$SDDM" = "y" ]; then
    sudo "$HOME/.dotfiles/install/arch/sddm-theme.sh" "$HOME/.dotfiles"
fi

if [ "$CLAUDE_SYNC" = "y" ]; then
    "$HOME/.dotfiles/install/common/filen-sync.sh"
fi
