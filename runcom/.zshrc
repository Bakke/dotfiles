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
for DOTFILE in "$DOTFILES_DIR"/system/.{env,function,alias,prompt,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,function,alias,prompt,completion}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if [ "$OS" = "Linux" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,function,alias,prompt,completion}.linux; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

# Load ncreate config
[[ -f $HOME/.bash_ncreate_config ]] && source $HOME/.bash_ncreate_config

# Init fasd
if [ -d "$HOME/.fasd-git" ]; then

    # Add fasd to PATH
    PATH=$PATH:$HOME/.fasd-git

    # Init fasd
    fasd_cache="$HOME/.fasd-init"
    if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
        fasd --init auto >| "$fasd_cache"
    fi
    source "$fasd_cache"
    unset fasd_cache

fi

[[ -f "${DOTFILES_DIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "${DOTFILES_DIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "${DOTFILES_DIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "${DOTFILES_DIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "${DOTFILES_DIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "${DOTFILES_DIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
[[ -f "${DOTFILES_DIR}/plugins/colored-man-pages/colored-man-pages.zsh" ]] && source "${DOTFILES_DIR}/plugins/colored-man-pages/colored-man-pages.zsh"

# Bind keys for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Clean up
unset SCRIPT_PATH DOTFILE
