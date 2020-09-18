# Update Homebrew, formulas and packages
brew update
brew upgrade

# Install packages
apps=(
	git
	grep
	ripgrep
	node
	python
	python3
	vim
	wget
	curl
	tmux
	hashcat
	ncdu
	nmap
	masscan
	openssl
	wireshark
	wpscan
	openvpn
	bat
	fd
	sqlmap
	hexedit
)

brew install "${apps[@]}"

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
