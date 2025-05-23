#!/usr/bin/env bash

# Update dotfiles itself first
[ -d "$HOME/.dotfiles/.git" ] && git --work-tree="$HOME/.dotfiles" --git-dir="$HOME/.dotfiles/.git" pull origin master

export FULL_INSTALL=false

if [[ $1 == "full" ]]; then
    FULL_INSTALL=true
fi

# Create config directory if it does not exist
[[ ! -d "$HOME/.config" ]] && mkdir "$HOME/.config"
[[ ! -d "$HOME/.local/bin" ]] && mkdir -p "$HOME/.local/bin"
[[ ! -d "$HOME/.vim/undo-dir" ]] && mkdir -p "$HOME/.vim/undo-dir"

# Bunch of symlinks
ln -sfv "$HOME/.dotfiles/runcom/.zshrc" ~/.zshrc
ln -sfv "$HOME/.dotfiles/runcom/.inputrc" ~/.inputrc
ln -sfv "$HOME/.dotfiles/config/vim/.vimrc" ~/.vimrc
ln -sfv "$HOME/.dotfiles/config/git/.gitconfig" ~/.gitconfig
ln -sfv "$HOME/.dotfiles/scripts/functions/" ~/.local/bin/functions
ln -sfv "$HOME/.dotfiles/config/nvim/" ~/.config/nvim
ln -sfv "$HOME/.dotfiles/config/yazi/" ~/.config/yazi
ln -sfv "$HOME/.dotfiles/config/tmux/.tmux.conf" ~/.tmux.conf

# LINUX_DISTRO=$(cat /etc/issue | awk '{print tolower($1)}')
LINUX_DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)

if [[ $LINUX_DISTRO == "arch" ]]; then
    . "$HOME/.dotfiles/install/arch.sh"
elif [[ $LINUX_DISTRO == "ubuntu" ]]; then
    . "$HOME/.dotfiles/install/ubuntu.sh"
elif [[ $LINUX_DISTRO == "kali" ]]; then
    . "$HOME/.dotfiles/install/kali.sh"
fi

# Change shell to ZSH
chsh -s /bin/zsh

# Install vim-plug
source "$HOME/.dotfiles/install/common/plug.sh"

# Update submodules
git submodule update --init --recursive
