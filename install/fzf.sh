FZF_DIR=~/.fzf

# Install/update Fasd
if [[ ! -e "$FZF_DIR" ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
  ~/.fzf/install
else
  cd "$FZF_DIR" && git pull origin master && cd -
fi

