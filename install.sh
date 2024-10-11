#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Create config directory if it does not exist
if [[ ! -e ~/.config ]]; then
    mkdir ~/.config
fi

# Create nvm directory if it does not exist
if [[ ! -e ~/.nvm ]]; then
    mkdir ~/.nvm
fi

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~/.zshrc
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~/.inputrc
ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~/.gitconfig
ln -sfv "$DOTFILES_DIR/config/nvim/" ~/.config/nvim
ln -sfv "$DOTFILES_DIR/config/tmux/.tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/config/kitty/" ~/.config/kitty
ln -sfv "$DOTFILES_DIR/config/alacritty/.alacritty.toml" ~/.alacritty.toml

if [[ $(uname) == "Darwin" ]]; then
    if [ -f "$DOTFILES_DIR/install/osx.sh" ]; then
        . "$DOTFILES_DIR/install/osx.sh"
    fi
else
    if [ -f "$DOTFILES_DIR/install/linux.sh" ]; then
        . "$DOTFILES_DIR/install/linux.sh"
    fi
fi

# Install vim-plug
source "$DOTFILES_DIR/install/plug.sh"

if [[ ! -e "${HOME}/.fasd-git" ]]; then
    echo "Do you want to install Fasd? [y/n]"
	read FASD
	if [ "$FASD" = "y" ]; then
		. "$DOTFILES_DIR/install/fasd.sh"
	fi
fi

# Update submodules
git submodule update --init --recursive
