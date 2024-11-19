LINUX_DISTRO=$(cat /etc/issue | awk '{print tolower($1)}')

export KUBECONFIG=$HOME/.kube/narnia

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$HOME/.dotfiles"/system/.{env,alias,function,prompt,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "${LINUX_DISTRO}" = "arch" ]; then
    for DOTFILE in "$HOME"/.dotfiles/system/.{env,alias,function,prompt,completion}.arch; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if [ "${LINUX_DISTRO}" = "kali" ]; then
    for DOTFILE in "$HOME"/.dotfiles/system/.{env,alias,function,prompt,completion}.arch; do
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

[[ -f "${HOME}/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "${HOME}/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "${HOME}/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
[[ -f "${HOME}/.dotfiles/plugins/colored-man-pages/colored-man-pages.zsh" ]] && source "${HOME}/.dotfiles/plugins/colored-man-pages/colored-man-pages.zsh"

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

if [[ -e "/usr/share/fzf/key-bindings.zsh" ]]; then
    source /usr/share/fzf/key-bindings.zsh
elif [[ -e "/usr/share/doc/fzf/examples/key-bindings.zsh" ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -e "/usr/share/fzf/completion.zsh" ]]; then
    source /usr/share/fzf/completion.zsh
elif [[ -e "/usr/share/doc/fzf/examples/completion.zsh" ]]; then
    source /usr/share/doc/fzf/examples/completion.zsh
fi

if [[ -e "$NVM_DIR" ]]; then
    source "${HOME}/.dotfiles/scripts/lazy-load-nvm.sh"
fi
