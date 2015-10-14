set nocompatible              " be iMproved, required
filetype off                  " required

" Ctrp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'

" Ag.vim
" let g:ag_working_path_mode="r"

" Vim Airline
" let g:airline_powerline_fonts = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim Airline
Plugin 'bling/vim-airline'

" Powerline
" Plugin 'Lokaltog/vim-powerline'

" Multiple cursors
Plugin 'terryma/vim-multiple-cursors.git'

" Ctrlp.vim
Plugin 'kien/ctrlp.vim.git'

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

" Hybrid Reverse Theme
Plugin 'kristijanhusak/vim-hybrid-material.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

set wildmenu
set wildmode=list:longest,full

" Syntax options
syntax on                  " syntax coloring
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized
" colorscheme material-theme
" colorscheme inkpot
let g:enable_bold_font = 1
colorscheme hybrid_reverse

" Powerline options
set guifont=Menlo:h12
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

" editing options
set virtualedit=block      " select unwritten chars in visual-block mode
set hlsearch               " syntax highlighting on last search
set incsearch              " instant (char by char) search
set relativenumber	       " relative line numbers
set background=dark        " light colors; more readable, but uglier
set bs=2                   " allow all backspacing in insert mode
set wildmode=longest,list  " bash-style tab-completion
set formatoptions+=or      " auto-insert comment characters
set title
set showmatch
set showcmd
set showtabline=2
set ruler		           " show the cursor position all the time
set showcmd		           " display incomplete commands

" tab/indenting options
filetype indent on   " per file indent
set autoindent       " new line starts indented
set cindent      " see help
set tabstop=4        " display width for old tab characters
set shiftwidth=4     " new tabs
set softtabstop=4    " how many spaces for tab key press
set expandtab        " always replace tab key with spaces
                     " if not set 2xtab makes one tab char
autocmd BufNewFile,BufRead Makefile,Makefile.in,Makefile.am set noexpandtab
autocmd BufNewFile,BufRead Makefile,Makefile.in,Makefile.am set softtabstop=0

" .viminfo settings
" read/write a .viminfo file, don't store more that 50 lines of registers
set viminfo='20,\"50
set history=50

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Tab navigation like firefox
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
inoremap <C-j> <Esc>:tabprevious<CR>i
inoremap <C-k> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-w> <Esc>:tabclose<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
