#!/usr/bin/env bash

if [ "${BASH_SOURCE[0]:-}" != "$0" ]; then
    echo "Run this as ~/.dotfiles/install.sh, not with source" >&2
    return 1
fi

set -euo pipefail

mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/.vim/undo-dir"

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
[ "$(basename "$SHELL")" != zsh ] && chsh -s "$(command -v zsh)"

# Install Neovim plugins
command -v nvim > /dev/null && nvim --headless "+Lazy! restore" +qa

# Update submodules
git -C "$HOME/.dotfiles" submodule update --init --recursive
