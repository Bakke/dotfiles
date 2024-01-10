git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ~/.dotfiles
rm -rf ~/yay

apps=(
    logiops
    g810-led-git
)

sudo pacman -S --noconfirm "${apps[@]}"
