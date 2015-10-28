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
npm install -g bower
npm install -g grunt
npm install -g gulp
