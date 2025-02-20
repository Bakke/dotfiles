" Enable vim enhanced functions
set nocompatible

" Set leader
let mapleader = ","

" Init autocmd
autocmd!

source ~/.dotfiles/config/vim/plug.vim
source ~/.dotfiles/config/vim/settings.vim
source ~/.dotfiles/config/vim/maps.vim
source ~/.dotfiles/config/vim/theme.vim
source ~/.dotfiles/config/vim/autocmd.vim

source ~/.dotfiles/config/vim/plugins/easyalign.vim
source ~/.dotfiles/config/vim/plugins/emmet.vim
source ~/.dotfiles/config/vim/plugins/fugitive.vim
source ~/.dotfiles/config/vim/plugins/fzf.vim
source ~/.dotfiles/config/vim/plugins/editorconfig.vim
source ~/.dotfiles/config/vim/plugins/copilot.vim
source ~/.dotfiles/config/vim/plugins/airline.vim
source ~/.dotfiles/config/vim/plugins/tmux-navigator.vim

" let g:PHP_noArrowMatching = 1
