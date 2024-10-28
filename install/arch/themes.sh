#!/bin/bash

if [ ! -d "${HOME}/.themes/Orchis" ]; then
    git clone https://github.com/vinceliuice/Orchis-theme.git
    cd Orchis-theme
    ./install.sh
    cd ..
    rm -rf Orchis-theme
fi
