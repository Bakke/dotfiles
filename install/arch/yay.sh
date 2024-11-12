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
    hyprswitch
)

fullApps=(
    1password
    logiops
)

yay --save --answerdiff None --answerclean None --removemake
yay -S --noconfirm "${apps[@]}"

if [[ $FULL_INSTALL == true ]]; then
    yay -S --noconfirm "${fullApps[@]}"
fi
