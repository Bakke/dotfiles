#!/bin/bash

fontDir="$HOME/.local/share/fonts/JetBrainsMono"

if [ ! -d "$fontDir" ]; then
    (
        tmp=$(mktemp -d)
        curl -fsSL -o "$tmp/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip \
            && unzip -q "$tmp/JetBrainsMono.zip" '*.ttf' -d "$tmp/fonts" \
            && mkdir -p "$(dirname "$fontDir")" \
            && mv "$tmp/fonts" "$fontDir" \
            && fc-cache -f "$fontDir"
        rm -rf "$tmp"
    )
fi
