#!/bin/bash

if [ ! -d "${HOME}/.local/share/icons/Tela" ]; then
    git clone https://github.com/vinceliuice/Tela-icon-theme.git
    cd Tela-icon-theme
    ./install.sh -a
    cd ..
    rm -rf Tela-icon-theme
fi
