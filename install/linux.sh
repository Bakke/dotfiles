mkdir -p ~/.local/share/fonts

. "$DOTFILES_DIR/install/pacman.sh"
. "$DOTFILES_DIR/install/nodejs.sh"
# . "$DOTFILES_DIR/install/cargo.sh"

if [[ ! -e "~/.local/share/fonts/SFMono Regular Nerd Font Complete.otf" ]]; then
    wget https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/heads/master.zip
    7z x master.zip
    cd SF-Mono-Nerd-Font-master && mv *.otf ~/.local/share/fonts/
    cd .. && rm -rf master.zip SF-Mono-Nerd-Font-master
fi
