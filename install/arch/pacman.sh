#!/bin/bash

# Install packages
sudo pacman -Syu

apps=(
    base-devel
    gcc
    make
    cmake
    man
    git
    grep
    python3
    python-pip
    ripgrep
    vi
    vim
    neovim
    python-pynvim
    imagemagick
    wget
    curl
    tmux
    ncdu
    yazi
    rofi
    rofi-calc
    rofi-emoji
    jq
    fd
    fzf
    bat
    zsh
    zsh-completions
    whois
    traceroute
    lsof
    bind
    vlc
    grim # Screenshots
    slurp # Screenshots
    ksnip # Annotate Screenshots
    wl-clipboard # Wayland clipboard
    p7zip
    rust
    alacritty
    zenity # Dialog boxes
    nautilus # File manager
    sushi # Preview files in Nautilus
    nwg-look # GTK theme and icons manager
    docker
    docker-compose
    postgresql-libs
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    papirus-icon-theme
    arc-gtk-theme

    # Hyprland / Sway stuff
    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    swaync
    qt5-wayland
    qt6-wayland
)

fullApps=(
    freerdp
    kubectl
    solaar # Logitech devices manager

    usbutils # Usb utilities
    bolt # Thunderbolt 3 device manager
    bluez # Bluetooth protocol stack
    bluez-utils # bluetoothctl utility
    blueman # Bluetooth GUI manager

    # Sound and media
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol # PulseAudio volume control
    playerctl
    brightnessctl
    hidapi

    # Gnome Keyring
    libsecret
    libgnome-keyring
    gnome-keyring
    seahorse
    gcr-4
)

sudo pacman -S --noconfirm "${apps[@]}"

if [[ $FULL_INSTALL == true ]]; then
    sudo pacman -S --noconfirm "${fullApps[@]}"
fi
