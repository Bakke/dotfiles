#!/usr/bin/env bash

# Update dotfiles itself first
[ -d "$HOME/.dotfiles/.git" ] && git --work-tree="$HOME/.dotfiles" --git-dir="$HOME/.dotfiles/.git" pull origin master

# Create config directory if it does not exist
[[ ! -d "$HOME/.config" ]] && mkdir "$HOME/.config"

# Bunch of symlinks
ln -sfv "$HOME/.dotfiles/runcom/.zshrc" ~/.zshrc
ln -sfv "$HOME/.dotfiles/runcom/.inputrc" ~/.inputrc
ln -sfv "$HOME/.dotfiles/config/vim/.vimrc" ~/.vimrc
ln -sfv "$HOME/.dotfiles/config/git/.gitconfig" ~/.gitconfig
ln -sfv "$HOME/.dotfiles/config/nvim/" ~/.config/nvim
ln -sfv "$HOME/.dotfiles/config/tmux/.tmux.conf" ~/.tmux.conf

LINUX_DISTRO=$(cat /etc/issue | awk '{print tolower($1)}')

if [[ $LINUX_DISTRO == "arch" ]]; then
    . "$HOME/.dotfiles/install/arch.sh"
elif [[ $LINUX_DISTRO == "ubuntu" ]]; then
    . "$HOME/.dotfiles/install/ubuntu.sh"
fi

# Change shell to ZSH
chsh -s /bin/zsh

# Install vim-plug
source "$HOME/.dotfiles/install/common/plug.sh"

if [[ ! -e "${HOME}/.fasd-git" ]]; then
    echo "Do you want to install Fasd? [y/n]"
    read FASD
    if [ "$FASD" = "y" ]; then
        . "$HOME/.dotfiles/install/common/fasd.sh"
    fi
fi

# Update submodules
git submodule update --init --recursive
