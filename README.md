# Bakke’s dotfiles
This is a work in progress! It targets OS X systems, but also works on Linux.

## Install
```
# Update software and OS X developer tools
sudo softwareupdate -i -a
xcode-select --install

# Clone repo
git clone git@github.com:Bakke/dotfiles.git ~/.dotfiles

# Run install script
cd ~/.dotfiles
source install.sh
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
