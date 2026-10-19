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

# Symlink into place, replacing an existing link and backing up a real file or directory
link() {
    [ -e "$2" ] && [ ! -L "$2" ] && mv -vT "$2" "$2.bak"
    ln -sfnv "$1" "$2"
}

link "$HOME/.dotfiles/runcom/.zshrc" ~/.zshrc
link "$HOME/.dotfiles/runcom/.inputrc" ~/.inputrc
link "$HOME/.dotfiles/config/git/.gitconfig" ~/.gitconfig
link "$HOME/.dotfiles/scripts/functions" ~/.local/bin/functions
link "$HOME/.dotfiles/config/nvim" ~/.config/nvim
link "$HOME/.dotfiles/config/yazi" ~/.config/yazi
link "$HOME/.dotfiles/config/tmux/.tmux.conf" ~/.tmux.conf

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
