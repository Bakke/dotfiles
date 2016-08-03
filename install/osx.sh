# Set hostname
sudo scutil --set HostName Kattekebab

# Setup ssh keys
. "$DOTFILES_DIR/install/ssh-keys.sh"

# Install Homebrew & brew-cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap homebrew/versions
brew tap caskroom/versions

# Install brew & brew-cask packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# Install ZSH (with Homebrew)
. "$DOTFILES_DIR/install/zsh.sh"

# Install SASS
sudo gem install sass

# Globally install with npm
sudo /usr/local/bin/npm install -g bower
sudo /usr/local/bin/npm install -g grunt
sudo /usr/local/bin/npm install -g gulp

# Set osx preferences
. "$DOTFILES_DIR/install/osx-preferences.sh"

# Setup osx salt states
. "$DOTFILES_DIR/install/osx-salt-states.sh"
