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
    p7zip-full
    cargo
    arc-theme
    papirus-icon-theme
    build-essential
)

sudo apt update && sudo apt install -y "${apps[@]}"
