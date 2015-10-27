ZSH_DIR=~/.oh-my-zsh

# Install/update oh-my-zsh
mkdir -p "$ZSH_DIR" && (git clone https://github.com/robbyrussell/oh-my-zsh.git "$ZSH_DIR" || (cd "$ZSH_DIR" && git pull origin master))
