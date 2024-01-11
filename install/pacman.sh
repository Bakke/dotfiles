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
    bluez
    bluez-utils
    docker
    docker-compose
    kubectl
    postgresql-libs
    gnome-shell-extensions
    ttf-jetbrains-mono-nerd
)

sudo pacman -S --noconfirm "${apps[@]}"
