# Install packages
apps=(
	git
	grep
	python3
    python3-pip
    python-is-python3
	ripgrep
	vim
    neovim
    python3-neovim
    wget
    curl
    tmux
	ncdu
	jq
	fzf
    vlc
    rofi
    p7zip-full
    cargo
    arc-theme
    papirus-icon-theme
    lxappearance
    cmake
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    libxcb-xfixes0-dev
    libxkbcommon-dev
)

sudo apt update && sudo apt install -y "${apps[@]}"
