if [ ! -x "$(command -v yay)" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf ~/yay
fi

apps=(
    gnome-shell-extension-pop-shell
    plymouth
    plymouth-theme-arch-charge
    ulauncher
    1password
    logiops
    # g810-led-git
    tidal-hifi-bin
    nordic-theme
)

# plymouth-set-default-theme -l
# sudo plymouth-set-default-theme -R arch-charge

yay -S --noconfirm "${apps[@]}"
