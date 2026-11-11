#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/.dotfiles"
LINUX_DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)

if [[ $LINUX_DISTRO == "arch" ]]; then
    yay -Syu
elif [[ $LINUX_DISTRO == "ubuntu" || $LINUX_DISTRO == "kali" ]]; then
    sudo apt update
    sudo apt full-upgrade
fi

. "$DOTFILES/install/common/nvm-init.sh"

# Latest release within the version the default alias pins (e.g. 22)
if command -v nvm > /dev/null && [ -s "$NVM_DIR/alias/default" ]; then
    nvm install "$(cat "$NVM_DIR/alias/default")"
fi

if command -v yarn > /dev/null; then
    yarn global upgrade --latest
fi

if command -v dotnet > /dev/null; then
    dotnet tool update --global --all
fi

if command -v composer > /dev/null; then
    composer global update
fi

# These two change tracked files (lazy-lock.json, submodule commits); commit them from one machine
if command -v nvim > /dev/null; then
    nvim --headless "+Lazy! sync" +qa
fi

git -C "$DOTFILES" submodule update --init --remote --recursive
