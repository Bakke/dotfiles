# Bakke’s dotfiles
This is a work in progress! It targets OS X systems.

## Install
```
# Clone repo
git clone git@github.com:Bakke/dotfiles.git ~/.dotfiles

# Backup existing files
cp ~/.bash_profile ~/.bash_profile.bak
cp ~/.gitconfig ~/.gitconfig.bak
cp ~/.vimrc ~/.vimrc.bak
cp ~/.tmux.conf ~/.tmux.conf.bak

# Remove existing files
rm ~/.bash_profile
rm ~/.gitconfig
rm ~/.vimrc
rm ~/.tmux.conf

# Symlink new files
ln -sv "/Users/username/.dotfiles/runcom/.bash_profile" ~
ln -sv "/Users/username/.dotfiles/git/.gitconfig" ~
ln -sv "/Users/username/.dotfiles/vim/.vimrc" ~
ln -sv "/Users/username/.dotfiles/tmux/.tmux.conf" ~
```
