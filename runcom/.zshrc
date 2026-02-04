# LINUX_DISTRO=$(cat /etc/issue | awk '{print tolower($1)}')
LINUX_DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)

export KUBECONFIG=$HOME/.kube/narnia.yaml

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$HOME/.dotfiles"/system/{env,alias,function,prompt,keybind,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "${LINUX_DISTRO}" = "arch" ]; then
    for DOTFILE in "$HOME"/.dotfiles/system/{env,alias,function,prompt,keybind,completion}.arch; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if [ "${LINUX_DISTRO}" = "kali" ]; then
    for DOTFILE in "$HOME"/.dotfiles/system/{env,alias,function,prompt,keybind,completion}.arch; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

[[ -f "${HOME}/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "${HOME}/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "${HOME}/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Clean up
unset SCRIPT_PATH DOTFILE

if whence fzf >/dev/null; then
    source <(fzf --zsh)
fi

if whence zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi

if [[ -e "$NVM_DIR" ]]; then
    # source "${HOME}/.dotfiles/scripts/lazy-load-nvm.sh"
    source /usr/share/nvm/init-nvm.sh
fi
