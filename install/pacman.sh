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
)

sudo pacman -S --noconfirm "${apps[@]}"
