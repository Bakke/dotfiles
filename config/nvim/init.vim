" Source default Vim config
source ~/.dotfiles/config/vim/.vimrc

if has("nvim")
    lua require('init')
endif
