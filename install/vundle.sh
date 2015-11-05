BUNDLE_DIR=~/.vim/bundle/Vundle.vim

# Install/update Vundle
mkdir -p "$BUNDLE_DIR" && (git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_DIR" || (cd "$BUNDLE_DIR" && git pull origin master))

if [[ ! -e "$BUNDLE_DIR" ]]; then
	mkdir -p "$BUNDLE_DIR"
	git clone git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_DIR"
else
	cd "$BUNDLE_DIR" && git pull origin master && cd -
fi

# Install bundles
vim +PluginInstall +qall
