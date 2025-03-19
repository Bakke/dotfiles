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
)

fullApps=(
    1password
    # logiops
)

pentestApps=(
    burpsuite
    wfuzz
    gobuster
    dirbuster
    sqlmap
)

yay --save --answerdiff None --answerclean None --removemake
yay -S --noconfirm "${apps[@]}"

if [[ $FULL_INSTALL == true ]]; then
    yay -S --noconfirm "${fullApps[@]}"
fi

echo "Do you want to install pentest tools? [y/N]"
read PENTEST
if [ "$PENTEST" = "y" ]; then
    yay -S --noconfirm "${pentestApps[@]}"
fi
