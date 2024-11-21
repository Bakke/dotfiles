#!/bin/bash

mkdir -p "${HOME}/.local/share"

git clone https://github.com/xdebug/vscode-php-debug.git "${HOME}/.local/share/vscode-php-debug"
cd "${HOME}/.local/share/vscode-php-debug"

npm install
npm run build

cd -
