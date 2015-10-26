# Shell
if [ -n "$ZSH_VERSION" ]; then
   SHELL_ZSH=true
   SHELL_BASH=false
elif [ -n "$BASH_VERSION" ]; then
   SHELL_BASH=true
   SHELL_ZSH=false
fi

# OS
if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink || which readlink)
if $SHELL_BASH; then
    CURRENT_SCRIPT=$BASH_SOURCE
else
    CURRENT_SCRIPT=$0
fi

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
    SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
    DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
    DOTFILES_DIR="$HOME/.dotfiles"
else
    echo "Unable to find dotfiles, exiting."
    return # `exit 1` would quit the shell itself
fi

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,env,alias,completion}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.osx; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if [ "$OS" = "Linux" ]; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.linux; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if $SHELL_BASH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function,completion}.bash; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

if $SHELL_ZSH; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function,completion}.zsh; do
        [ -f "$DOTFILE" ] && . "$DOTFILE"
    done
fi

# Load oh-my-zsh
[[ "$SHELL_ZSH" = true && -a $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# Load Bash It
[[ "$SHELL_BASH" = true && -a $BASH_IT/bash_it.sh ]] && source $BASH_IT/bash_it.sh

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

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE
