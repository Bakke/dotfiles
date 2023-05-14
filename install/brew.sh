# Update Homebrew, formulas and packages
brew update
brew upgrade

# Install packages
apps=(
	git
	grep
	python
	python3
	ripgrep
	vim
    neovim
    nvm
    wget
    curl
    tmux
	ncdu
	nmap
	jq
	bat
	fd
	fzf
	rga
    htop
    docker-compose
)

brew install "${apps[@]}"

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
