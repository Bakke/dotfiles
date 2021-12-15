mkdir -p ~/.config/rofi
mkdir -p ~/.local/share/fonts

ln -sfv "$DOTFILES_DIR/rofi/config.rasi" ~/.config/rofi/

. "$DOTFILES_DIR/install/nvim.sh"
. "$DOTFILES_DIR/install/apt.sh"
. "$DOTFILES_DIR/install/nodejs.sh"

echo "Do you want to install Alacritty? [y/n]"
read ALACRITTY
if [ "$ALACRITTY" = "y" ]; then
	. "$DOTFILES_DIR/install/alacritty.sh"
fi

if [[ ! -e "~/.local/share/fonts/SFMono Regular Nerd Font Complete.otf" ]]; then
    wget https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/heads/master.zip
    7z x master.zip
    cd SF-Mono-Nerd-Font-master && mv *.otf ~/.local/share/fonts/
    cd .. && rm -rf master.zip SF-Mono-Nerd-Font-master
fi
