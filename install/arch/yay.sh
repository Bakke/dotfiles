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
    brave-bin
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
yay -S --needed --noconfirm "${apps[@]}"

if [ "$FULL_INSTALL" = "y" ]; then
    yay -S --needed --noconfirm "${fullApps[@]}"
fi

if [ "$PENTEST" = "y" ]; then
    yay -S --needed --noconfirm "${pentestApps[@]}"
fi
