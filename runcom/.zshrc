# OS
if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

export KUBECONFIG=$HOME/.kube/narnia

if [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function,prompt,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function,prompt,completion}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if [ "$OS" = "Linux" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function,prompt,completion}.linux; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

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
bindkey '^ ' autosuggest-accept # ctrl + space
bindkey '^K' history-substring-search-up # ctrl + k
bindkey '^J' history-substring-search-down # ctrl + j
bindkey '^[[A' history-substring-search-up # Arrow up
bindkey '^[[B' history-substring-search-down # Arrow down
# bindkey -r '^[[A'
# bindkey -r '^[[B'

# Clean up
unset SCRIPT_PATH DOTFILE

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "${DOTFILES_DIR}/lazy-load-nvm.sh"
