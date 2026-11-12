# LINUX_DISTRO=$(cat /etc/issue | awk '{print tolower($1)}')
LINUX_DISTRO=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)

export KUBECONFIG=$HOME/.kube/narnia.yaml
#export KUBECONFIG=$HOME/.kube/upcloud.yaml

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$HOME/.dotfiles"/system/{env,alias,function,prompt,keybind,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

for DOTFILE in "$HOME"/.dotfiles/system/{env,alias,function,prompt,keybind,completion}.${LINUX_DISTRO}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ -f "$HOME/.env.local" ]; then
    source "$HOME/.env.local"
fi

[[ -f "${HOME}/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "${HOME}/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "${HOME}/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]] && source "${HOME}/.dotfiles/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Clean up
unset SCRIPT_PATH DOTFILE

# if whence fzf >/dev/null; then
if (( $+commands[fzf] )); then
    if fzf --zsh > /dev/null 2>&1; then
        eval "$(fzf --zsh)"
    else # fzf < 0.48 (Debian/Ubuntu LTS)
        for FZF_FILE in /usr/share/doc/fzf/examples/{key-bindings,completion}.zsh; do
            [ -f "$FZF_FILE" ] && source "$FZF_FILE"
        done
        unset FZF_FILE
    fi
fi

# if whence zoxide >/dev/null; then
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi

if [[ -e "$NVM_DIR" ]]; then
    # Put the newest install matching the default alias on PATH without loading nvm.sh
    if [[ -s "$NVM_DIR/alias/default" ]]; then
        NVM_DEFAULT="$(<"$NVM_DIR/alias/default")"
        NVM_DEFAULT=( "$NVM_DIR"/versions/node/v${NVM_DEFAULT#v}(|.*)(N/nOn) )
        (( $#NVM_DEFAULT )) && export PATH="$NVM_DEFAULT[1]/bin:$PATH"
        unset NVM_DEFAULT
    fi

    nvm() {
        unset -f nvm
        if [ -s /usr/share/nvm/nvm.sh ]; then
            . /usr/share/nvm/nvm.sh --no-use
            . /usr/share/nvm/bash_completion
        elif [ -s "$NVM_DIR/nvm.sh" ]; then
            . "$NVM_DIR/nvm.sh" --no-use
            . "$NVM_DIR/bash_completion"
        fi
        nvm "$@"
    }
fi
