#!/bin/bash

if [ ! -d /usr/share/i3blocks ]; then
    sudo git clone --depth 1 https://github.com/vivien/i3blocks-contrib.git /usr/share/i3blocks
fi
