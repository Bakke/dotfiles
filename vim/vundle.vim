" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Bracketed paste
Plugin 'ConradIrwin/vim-bracketed-paste.git'

" Vim Airline
Plugin 'bling/vim-airline'

" Powerline
" Plugin 'Lokaltog/vim-powerline'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors.git'

" Ctrlp.vim
Plugin 'kien/ctrlp.vim.git'

" NERD Tree
Plugin 'scrooloose/nerdtree.git'

" Ack.vim
Plugin 'mileszs/ack.vim'

" Vim Surround
Plugin 'tpope/vim-surround'

" Ag.vim
" Plugin 'rking/ag.vim.git'

" Commentary.vim
Plugin 'tpope/vim-commentary'

" Vim CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Emmet-vim
Plugin 'mattn/emmet-vim'

" Oceanic next color scheme
Plugin 'mhartington/oceanic-next'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
