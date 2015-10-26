# Install/update oh-my-zsh
mkdir -p "$ZSH" && (git clone https://github.com/robbyrussell/oh-my-zsh.git "$ZSH" || (cd "$ZSH" && git pull origin master))
