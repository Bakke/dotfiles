#!/bin/bash

# Install packages
sudo pacman -Syu --noconfirm

apps=(
    base-devel
    cmake
    cpio
    meson
    man-db
    man-pages
    git
    python
    python-pip
    ripgrep
    vim
    neovim
    python-pynvim
    imagemagick
    wget
    curl
    tmux
    ncdu
    yazi
    ueberzugpp # Image preview in Yazi
    rofi
    rofi-calc
    rofi-emoji
    zoxide # Directory jump
    jq
    fd
    fzf
    bat
    zsh
    zsh-completions
    nmap
    whois
    traceroute
    openbsd-netcat
    lsof
    inetutils # Network utilities (ftp, telnet, etc)
    bind
    vlc
    vlc-plugins-all
    ksnip # Annotate Screenshots
    7zip
    unzip
    rust
    alacritty
    zenity # Dialog boxes
    nautilus # File manager
    sushi # Preview files in Nautilus
    nwg-look # GTK theme and icons manager
    docker
    docker-compose
    postgresql-libs
    dotnet-sdk
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
    otf-font-awesome
    papirus-icon-theme
    nvm
    yarn
    bc # vmrss dependency

    # PHP
    php
    composer

    # Sound and media
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol # PulseAudio volume control
    playerctl
    brightnessctl
    hidapi

    # Language servers (LSP)
    lua-language-server

    fwupd # Firmware update daemon
    hyprpolkitagent # Polkit agent for Hyprland
    exfatprogs # exFAT support
    usbutils # Usb utilities
    bolt # Thunderbolt 3 device manager
    bluez # Bluetooth protocol stack
    bluez-utils # bluetoothctl utility
    blueman # Bluetooth GUI manager
    gcr-4 # SSH agent, see env.arch
)

waylandApps=(
    wev # Wayland event viewer (find keycodes etc)
    waybar
    grim
    slurp
    swaync
    wtype
    wl-clipboard
    qt5-wayland
    qt6-wayland
)

hyprApps=(
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
)

swayApps=(
    swaybg
    swayidle
    swaylock
)

i3Apps=(
    feh
    xclip
    i3lock
    i3status
    i3blocks
    arandr
    xss-lock
    lxappearance
    sysstat
)

fullApps=(
    freerdp
    kubectl
    solaar # Logitech devices manager

    # Gnome Keyring
    libsecret
    gnome-keyring
    seahorse
)

sudo pacman -S --needed --noconfirm "${apps[@]}"
systemctl --user enable --now gcr-ssh-agent.socket

if [ "$FULL_INSTALL" = "y" ]; then
    sudo pacman -S --needed --noconfirm "${fullApps[@]}"
fi

if [ "$HYPR" = "y" ]; then
    sudo pacman -S --needed --noconfirm "${waylandApps[@]}" "${hyprApps[@]}"
fi

if [ "$SWAY" = "y" ]; then
    sudo pacman -S --needed --noconfirm "${waylandApps[@]}" "${swayApps[@]}"
fi

if [ "$I3" = "y" ]; then
    sudo pacman -S --needed --noconfirm "${i3Apps[@]}"
fi
