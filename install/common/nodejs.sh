#!/bin/bash

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"

if [ -s /usr/share/nvm/init-nvm.sh ]; then
    . /usr/share/nvm/init-nvm.sh
elif [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi

nvm install --lts node
# npm install --global yarn

yarn config set prefix ~/.yarn

yarnPackages=(
    tree-sitter-cli
    vscode-langservers-extracted
    vscode-json-languageserver
    bash-language-server
    dockerfile-language-server-nodejs
    intelephense
    pyright
    svelte-language-server
    # sql-language-server
    yaml-language-server
    twiggy-language-server
    vim-language-server
    @vtsls/language-server
    @vue/language-server
    # @postgres-language-server/cli
    @agentclientprotocol/claude-agent-acp
)

yarn global add "${yarnPackages[@]}"
