FASD_DIR=~/.fasd-git

# Install/update Fasd
if [[ ! -e "$FASD_DIR" ]]; then
  mkdir -p "$FASD_DIR"
  git clone https://github.com/clvv/fasd.git "$FASD_DIR"
  ln -sfv "$HOME/.dotfiles/config/fasd/.fasd-init" ~
else
  cd "$FASD_DIR" && git pull origin master && cd -
fi
