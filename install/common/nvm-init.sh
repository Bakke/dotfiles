#!/bin/bash

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"

if [ -s /usr/share/nvm/init-nvm.sh ]; then
    . /usr/share/nvm/init-nvm.sh
elif [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi
