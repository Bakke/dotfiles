# Update Homebrew, formulas and packages
brew update
brew upgrade

# Install packages
apps=(
    git
    grep
	ripgrep
    node
    nvm
    python
    vim
    wget
    curl
    tmux
    redis
	elasticsearch
	hashcat
	ncdu
	nmap
	masscan
	openssl
	wireshark
	wpscan
	wp-cli
	wp-cli-completion
	openvpn
	bat
	fd
)

brew install "${apps[@]}"

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
