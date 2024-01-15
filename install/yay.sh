if [ ! -x "$(command -v yay)" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf ~/yay
fi

apps=(
    logiops
    g810-led-git
    tidal-hifi-bin
)

yay -S --noconfirm "${apps[@]}"
