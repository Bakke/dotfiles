#!/bin/bash

git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git .tmp-nerd-fonts
cd .tmp-nerd-fonts

./install.sh JetBrainsMono

cd ..
rm -rf .tmp-nerd-fonts
