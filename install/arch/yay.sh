#!/bin/bash

if [ ! -x "$(command -v yay)" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf ~/yay
fi

apps=(
    cheat
    1password
    logiops
    hyprswitch
)

yay --save --answerdiff None --answerclean None --removemake
yay -S --noconfirm "${apps[@]}"
