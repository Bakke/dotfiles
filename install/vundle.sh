BUNDLE_DIR=~/.vim/bundle

# Install/update Vundle
mkdir -p "$BUNDLE_DIR" && (git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_DIR/Vundle.vim" || (cd "$BUNDLE_DIR/Vundle.vim" && git pull origin master))

# Install bundles
vim +PluginInstall +qall
