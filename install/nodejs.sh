wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.zshrc
nvm install --lts node
npm install --global yarn

yarn global add bash-language-server pyright sql-language-server yaml-language-server vim-language-server dockerfile-language-server-nodejs intelephense vscode-langservers-extracted
