. "$DOTFILES_DIR/install/pacman.sh"
. "$DOTFILES_DIR/install/nodejs.sh"
. "$DOTFILES_DIR/install/yay.sh"
. "$DOTFILES_DIR/install/cargo.sh"
. "$DOTFILES_DIR/install/linux/themes.sh"
. "$DOTFILES_DIR/install/linux/icons.sh"

sudo "$DOTFILES_DIR/install/linux/sddm-theme.sh"

# Create config directory if it does not exist
if [[ ! -e ~/.config/sway ]]; then
    mkdir ~/.config/sway
fi

# Delete config directory if it does exist
# We will symlink this to the dotfiles directory
if [[ -e ~/.config/hypr ]]; then
    rm -rf ~/.config/hypr
fi

ln -sfv "$DOTFILES_DIR/config/waybar" "${HOME}/.config/waybar"
ln -sfv "$DOTFILES_DIR/config/hypr/" "${HOME}/.config/hypr"
ln -sfv "$DOTFILES_DIR/config/sway/" "${HOME}/.config/sway"
ln -sfv "$DOTFILES_DIR/config/rofi/" "${HOME}/.config/rofi"
ln -sfv "$DOTFILES_DIR/config/xkb/" "${HOME}/.config/xkb"
ln -sfv "$DOTFILES_DIR/config/mimeapps.list" "${HOME}/.config/mimeapps.list"

if [ ! $(getent group "docker") ]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
fi

sudo ln -sfv "$DOTFILES_DIR/etc/logid.cfg" /etc/

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl enable bluetooth.service
sudo systemctl enable logid.service

# sudo g810-led -p /etc/g810-led/profile

# if [[ ! -e "~/.local/share/fonts/SFMono Regular Nerd Font Complete.otf" ]]; then
#     wget https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/heads/master.zip
#     7z x master.zip
#     cd SF-Mono-Nerd-Font-master && mv *.otf ~/.local/share/fonts/
#     cd .. && rm -rf master.zip SF-Mono-Nerd-Font-master
# fi
