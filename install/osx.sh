# Set hostname
sudo scutil --set HostName Kattekebab

# Setup ssh keys
#. "$DOTFILES_DIR/install/ssh-keys.sh"

# Install Homebrew & brew-cask
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask
brew install brew-cask-completion
brew tap homebrew/cask-versions

# Install brew & brew-cask packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# Install ZSH (with Homebrew)
. "$DOTFILES_DIR/install/zsh.sh"

# Install SASS
sudo gem install sass

# Set osx preferences
. "$DOTFILES_DIR/install/osx-preferences.sh"

echo "Do you want to install Composer? [y/n]"
read COMPOSER
if [ "$COMPOSER" = "y" ]; then
	. "$DOTFILES_DIR/install/composer.sh"
fi

echo "Do you want to install Laravel Installer? [y/n]"
read LARAVEL
if [ "$LARAVEL" = "y" ]; then
	. "$DOTFILES_DIR/install/laravel-installer.sh"
fi

if [[ ! -e "~/Library/Fonts/SFMono Regular Nerd Font Complete.otf" ]]; then
    wget https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/heads/master.zip
    unzip -a master.zip
    cd SF-Mono-Nerd-Font-master && mv *.otf ~/Library/Fonts/
    cd .. && rm -rf master.zip SF-Mono-Nerd-Font-master
fi
