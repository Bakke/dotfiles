# Bakke’s dotfiles
Mainly for Arch Linux desktop, but also works for Ubuntu servers.

## Install
```
# Clone repo
git clone git@github.com:Bakke/dotfiles.git ~/.dotfiles

# Run install script
cd ~/.dotfiles
source install.sh
git submodule update --init --recursive
```

# Update submodules
```
git submodule update --remote
```

### Temp fix for e1000e suspend issue
https://bbs.archlinux.org/viewtopic.php?id=298146

```
sudo rmmod e1000e # To disable ethernet card
sudo modprobe e1000e # To enable ethernet card
```

Or blacklist the module
```
echo "blacklist e1000e" | sudo tee /etc/modprobe.d/e1000e.conf
```

### MacBook Pro 2012 WiFi fix

```
yay -S broadcom-wl
sudo modprobe -r wl
sudo modprobe wl
```
