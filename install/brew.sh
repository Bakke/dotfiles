# Update Homebrew, formulas and packages
brew update
brew upgrade

# Install packages
apps=(
    git
    grep --default-names
	ripgrep
    node
    nvm
    python
    vim --with-cscope --with-python --with-lua --override-system-vim
    wget
    curl
    tmux
    redis
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
	fzf
)

brew install "${apps[@]}"
