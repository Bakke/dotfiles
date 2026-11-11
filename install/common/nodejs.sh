#!/bin/bash

. "$HOME/.dotfiles/install/common/nvm-init.sh"

[ "$(nvm version 'lts/*')" != N/A ] || nvm install --lts node
command -v yarn > /dev/null || npm install --global yarn

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

globalPackageJson="$(yarn global dir)/package.json"
missing=()
for package in "${yarnPackages[@]}"; do
    jq -e --arg p "$package" '.dependencies[$p]' "$globalPackageJson" > /dev/null 2>&1 || missing+=("$package")
done

if [ ${#missing[@]} -gt 0 ]; then
    yarn global add "${missing[@]}"
fi
