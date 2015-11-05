ZSH_DIR=~/.oh-my-zsh

# Install/update oh-my-zsh
if [[ ! -e "$ZSH_DIR" ]]; then
	mkdir -p "$ZSH_DIR"
	git clone https://github.com/robbyrussell/oh-my-zsh.git "$ZSH_DIR"
else
	cd "$ZSH_DIR" && git pull origin master && cd -
fi
