mkdir -p ~/.config/rofi
mkdir -p ~/.local/share/fonts

ln -sfv "$DOTFILES_DIR/rofi/config" ~/.config/rofi/

. "$DOTFILES_DIR/install/nvim.sh"
. "$DOTFILES_DIR/install/apt.sh"

if [[ ! -e "~/.local/share/fonts/SFMono Regular Nerd Font Complete.otf" ]]; then
    wget https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/heads/master.zip
    7z x master.zip
    cd SF-Mono-Nerd-Font-master && mv *.otf ~/.local/share/fonts/
    cd .. && rm -rf master.zip SF-Mono-Nerd-Font-master
fi
