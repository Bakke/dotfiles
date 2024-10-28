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
    bolt # Thunderbolt 3 device manager
    bluez # Bluetooth protocol stack
    bluez-utils # bluetoothctl utility
    blueman # Bluetooth GUI manager
    zenity # Dialog boxes
    usbutils # Usb utilities
    freerdp
    nautilus # File manager
    sushi # Preview files in Nautilus
    solaar # Logitech devices manager
    nwg-look # GTK theme and icons manager
    docker
    docker-compose
    kubectl
    postgresql-libs
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    papirus-icon-theme

    # Gnome Keyring
    libsecret
    libgnome-keyring
    gnome-keyring
    seahorse
    gcr-4

    # Hyprland / Sway stuff
    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    swaync
    qt5-wayland
    qt6-wayland

    # Sound and media
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol # PulseAudio volume control
    playerctl
    brightnessctl
    hidapi
)

sudo pacman -S --noconfirm "${apps[@]}"
