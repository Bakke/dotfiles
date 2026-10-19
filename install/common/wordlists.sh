#!/bin/bash

sudo mkdir -p /usr/share/wordlists

if [ ! -d /usr/share/wordlists/seclists ]; then
    sudo git clone --depth 1 https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/seclists
fi

(
    tmp=$(mktemp -d)
    wget -qO "$tmp/master.zip" https://github.com/3ndG4me/KaliLists/archive/refs/heads/master.zip \
        && unzip -q "$tmp/master.zip" -d "$tmp" \
        && sudo cp -rn "$tmp"/KaliLists-master/. /usr/share/wordlists/
    rm -rf "$tmp"
)
