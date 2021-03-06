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
    node
    nvm
    wget
    curl
    tmux
	ncdu
	nmap
	bat
	fd
	fzf
	pandoc
	poppler
	tesseract
	ffmpeg
	rga
	ctags
)

brew install "${apps[@]}"

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
