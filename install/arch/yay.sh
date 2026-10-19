#!/bin/bash

if ! command -v yay > /dev/null; then
    (
        tmp=$(mktemp -d)
        git clone --depth 1 https://aur.archlinux.org/yay.git "$tmp/yay" \
            && cd "$tmp/yay" \
            && makepkg -si --noconfirm
        rm -rf "$tmp"
    )
fi

apps=(
    cheat
    sesh-bin
    gitmux-bin
    terraform-ls
    postgres-language-server-bin
)

fullApps=(
    infisical-bin
    1password
    bruno-bin
    claude-code
    filen-desktop-bin
    catppuccin-gtk-theme-mocha
    # pdfcraft-bin
    # wordcraft-bin
    # gridcraft-bin
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
