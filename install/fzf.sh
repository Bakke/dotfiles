FZF_DIR=~/.fzf

# Install/update Fasd
if [[ ! -e "$FZF_DIR" ]]; then
  mkdir -p "$FZF_DIR"
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
  cd "$FZF_DIR"
  ./install
  cd -
else
  cd "$FZF_DIR" && git pull origin master && cd -
fi
