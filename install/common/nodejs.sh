#!/bin/bash

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

if [ "$ZSH_VERSION" ] && compctl; then # zsh
    source ~/.zshrc
elif [ "$BASH_VERSION" ] && complete; then # bash
    source ~/.bashrc
elif [ "$FISH_VERSION" ]; then # bash
    source ~/.config/fish/config.fish
fi

nvm install --lts node
npm install --global yarn

yarn config set prefix ~/.yarn

# yarn global add \
#     @vue/language-server \
#     bash-language-server \
#     dockerfile-language-server-nodejs \
#     intelephense \
#     pyright \
#     sql-language-server \
#     svelte-language-server \
#     vim-language-server \
#     vscode-langservers-extracted \
#     yaml-language-server
