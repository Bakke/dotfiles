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
    gnome-shell-extensions
    gnome-shell-extension-appindicator
    sushi
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    papirus-icon-theme
)

sudo pacman -S --noconfirm "${apps[@]}"
