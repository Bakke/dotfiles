wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

if [ "$ZSH_VERSION" ] && compctl; then # zsh
    source ~/.zshrc
elif [ "$BASH_VERSION" ] && complete; then # bash
    source ~/.bashrc
elif [ "$FISH_VERSION" ]; then # bash
    source ~/.config/fish/config.fish
fi

nvm install --lts node
npm install --global yarn

yarn config set prefix ~/.yarn
yarn global add bash-language-server pyright sql-language-server yaml-language-server vim-language-server dockerfile-language-server-nodejs intelephense vscode-langservers-extracted rofi-search
