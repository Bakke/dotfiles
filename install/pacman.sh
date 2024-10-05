# Install packages
sudo pacman -Syu

apps=(
    base-devel
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
    wget
    curl
    tmux
    ncdu
    rofi
    rofi-calc
    rofi-emoji
    jq
    fd
    fzf
    vlc
    grim
    slurp
    wl-clipboard
    p7zip
    rust
    alacritty
    bolt
    bluez
    bluez-utils
    blueman
    usbutils
    gcc
    make
    cmake
    hidapi
    remmina
    freerdp
    nautilus
    solaar
    nwg-look
    docker
    docker-compose
    kubectl
    postgresql-libs
    sushi
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

    waybar
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    imagemagick
    swaync
    pipewire
    pipewire-pulse
    wireplumber
    pavucontrol
    playerctl
    brightnessctl
    qt5-wayland
    qt6-wayland
    hidapi
)

sudo pacman -S --noconfirm "${apps[@]}"
