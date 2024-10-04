if [ ! -x "$(command -v yay)" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf ~/yay
fi

apps=(
    1password
    logiops
    nordic-theme
    # gnome-shell-extension-pop-shell
    # plymouth
    # plymouth-theme-arch-charge
    # g810-led-git
    # tidal-hifi-bin
)

# plymouth-set-default-theme -l
# sudo plymouth-set-default-theme -R arch-charge

yay --save --answerdiff None --answerclean None --removemake
yay -S --noconfirm "${apps[@]}"
