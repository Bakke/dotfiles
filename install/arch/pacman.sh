#!/bin/bash

# Install packages
sudo pacman -Syu

apps=(
    base-devel
    gcc
    make
    cmake
    cpio
    meson
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
    bind
    vlc
    ksnip # Annotate Screenshots
    p7zip
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
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    papirus-icon-theme

    # Sound and media
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol # PulseAudio volume control
    playerctl
    brightnessctl
    hidapi

    usbutils # Usb utilities
    bolt # Thunderbolt 3 device manager
    bluez # Bluetooth protocol stack
    bluez-utils # bluetoothctl utility
    blueman # Bluetooth GUI manager
)

hyprApps=(
    wev # Wayland event viewer (find keycodes etc)
    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    grim
    slurp
    swaync
    wtype
    wl-clipboard
    qt5-wayland
    qt6-wayland
)

swayApps=(
    wev # Wayland event viewer (find keycodes etc)
    waybar
    swaybg
    swayidle
    swaylock
    grim
    slurp
    swaync
    wtype
    wl-clipboard
    qt5-wayland
    qt6-wayland
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
    libgnome-keyring
    gnome-keyring
    seahorse
    gcr-4
)

sudo pacman -S --noconfirm "${apps[@]}"

if [[ $FULL_INSTALL == true ]]; then
    sudo pacman -S --noconfirm "${fullApps[@]}"
fi

echo "Do you want to install Hyprland apps? [y/N]"
read HYPR
if [ "$HYPR" = "y" ]; then
    sudo pacman -S --noconfirm "${hyprApps[@]}"
fi

echo "Do you want to install Sway apps? [y/N]"
read SWAY
if [ "$SWAY" = "y" ]; then
    sudo pacman -S --noconfirm "${swayApps[@]}"
fi

echo "Do you want to install i3 apps? [y/N]"
read I3
if [ "$I3" = "y" ]; then
    sudo pacman -S --noconfirm "${i3Apps[@]}"
fi
