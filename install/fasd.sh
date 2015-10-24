FASD_DIR=~/.fasd-git

# Install/update Vundle
mkdir -p "$FASD_DIR" && (git clone https://github.com/clvv/fasd.git "$FASD_DIR" || (cd "$FASD_DIR" && git pull origin master))
