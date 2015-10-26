#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Create vim directory if it does not exist
if [[ ! -e "~/.vim" ]]; then
    mkdir "~/.vim"
fi

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/vim/vundle.vim" ~/.vim/
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~

# Install Vundle
source "$DOTFILES_DIR/install/vundle.sh"

# Install fasd
source "$DOTFILES_DIR/install/fasd.sh"

# Install oh-my-zsh
source "$DOTFILES_DIR/install/oh-my-zsh.sh"
