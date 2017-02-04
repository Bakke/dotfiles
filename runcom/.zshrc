# OS
if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

if [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{env,plugins,function,alias,prompt,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,plugins,function,alias,prompt,completion}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if [ "$OS" = "Linux" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,plugins,function,alias,prompt,completion}.linux; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

# Load ncreate config
[[ -f $HOME/.bash_ncreate_config ]] && source $HOME/.bash_ncreate_config

# Clean up
unset SCRIPT_PATH DOTFILE
