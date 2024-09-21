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
    jq
    fzf
    vlc
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
    docker
    docker-compose
    kubectl
    postgresql-libs
    sushi
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    papirus-icon-theme

    # Gnome Keyring
    libsecret
    libgnome-keyring
    gnome-keyring
    seahorse
    gcr-4

    hyprlock
    cpio # For hyprpm
    fprintd
    imagemagick
    swaync
    pipewire
    wireplumber
    qt5-wayland
    qt6-wayland
    polkit-kde-agent
    hidapi
)

sudo pacman -S --noconfirm "${apps[@]}"
