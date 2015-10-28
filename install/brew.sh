# Update Homebrew, formulas and packages
brew update
brew upgrade

# Install packages
apps=(
    git
    grep --default-names
    ack
    node
    nvm
    python
    vim
    wget
    curl
    tmux
    reattach-to-user-namespace
)

brew install "${apps[@]}"
