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
    netcat
	jq
	bat
	fd
	fzf
	rga
    htop
    docker-compose
    libpq
    yarn
    font-jetbrains-mono-nerd-font
)

brew install "${apps[@]}"

# Link PostgreSQL binaries
brew link --force libpq

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
