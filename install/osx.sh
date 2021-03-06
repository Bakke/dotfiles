# Set hostname
sudo scutil --set HostName Kattekebab

# Setup ssh keys
#. "$DOTFILES_DIR/install/ssh-keys.sh"

# Install Homebrew & brew-cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask
brew install brew-cask-completion
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Install brew & brew-cask packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# Install ZSH (with Homebrew)
. "$DOTFILES_DIR/install/zsh.sh"

# Install SASS
sudo gem install sass

# Set osx preferences
. "$DOTFILES_DIR/install/osx-preferences.sh"

read -p "\033[0;32mDo you want to install Composer? [y/n] \033[0m" COMPOSER
if [ "$COMPOSER" = "y" ]; then
	. "$DOTFILES_DIR/install/composer.sh"
fi

read -p "\033[0;32mDo you want to install Laravel Installer? [y/n] \033[0m" LARAVEL
if [ "$LARAVEL" = "y" ]; then
	. "$DOTFILES_DIR/install/laravel-installer.sh"
fi

read -p "\033[0;32mDo you want to install Homestead? [y/n] \033[0m" HOMESTEAD
if [ "$HOMESTEAD" = "y" ]; then
	. "$DOTFILES_DIR/install/homestead.sh"
fi
