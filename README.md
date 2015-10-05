# Bakke’s dotfiles
This is a work in progress! It targets OS X systems.

## Install
```
# Backup existing files
cp ~/.bash_profile ~/.bash_profile.bak
cp ~/.gitconfig ~/.gitconfig.bak
cp ~/.vimrc ~/.vimrc.bak
cp ~/.tmux.conf ~/.tmux.conf.bak

# Symlink new files
ln -sv “~/.dotfiles/runcom/.bash_profile” ~
ln -sv “~/.dotfiles/git/.gitconfig” ~
ln -sv “~/.dotfiles/vim/.vimrc ~
ln -sv “~/.dotfiles/timux/.tmux.conf ~
```
