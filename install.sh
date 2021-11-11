#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Create vim directory if it does not exist
if [[ ! -e ~/.vim ]]; then
    mkdir ~/.vim
fi

# Create vim airline themes directory if it does not exist
if [[ ! -e ~/.vim/autoload/airline/themes ]]; then
    mkdir ~/.vim/autoload/airline/themes
fi

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/nvim/" ~/.config/
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/.alacritty.yml" ~

if [[ $(uname) == "Darwin" ]]; then
    if [ -f "$DOTFILES_DIR/install/osx.sh" ]; then
        . "$DOTFILES_DIR/install/osx.sh"
    fi
fi

# Install Vundle
# source "$DOTFILES_DIR/install/vundle.sh"

# Install vim-plug
source "$DOTFILES_DIR/install/plug.sh"

# Create vim dirs for swap, undo and backup
mkdir ~/.vim/{swap,undodir,backup}

if [[ ! -e ~/.fasd-git ]]; then

	read -p "Do you want to install Fasd? [y/n]" FASD
	if [ "$FASD" = "y" ]; then
		. "$DOTFILES_DIR/install/fasd.sh"
	fi

fi

# Update submodules
git submodule update --init --recursive

