# Install packages
apps=(
	git
	grep
	python3
    python3-pip
	ripgrep
	vim
    nvm
    wget
    curl
    tmux
	ncdu
	jq
	fzf
	rga
    vlc
    7z
    rofi
    cargo
    arc-theme
    papirus-icon-theme
)

sudo apt update && sudo apt install -y "${apps[@]}"

cargo install alacritty
