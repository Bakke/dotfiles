set nocompatible              " be iMproved, required
filetype off                  " required

" Use tab for emmet vim
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Ctrp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" Toggle NERD Tree
map <C-i> :NERDTreeToggle<CR>

" SHow hidden files in NERD Tree
let NERDTreeShowHidden=1

" Vundle plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ConradIrwin/vim-bracketed-paste.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'jdkanani/vim-material-theme.git'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Bash style tab completion
set wildmenu
set wildmode=list:longest,full

" Enter selects completion option without creating newline
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Syntax options
syntax on                  " syntax coloring
silent! colorscheme material-theme

" Powerline options
set guifont=Menlo:h12
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set laststatus=2

" editing options
set virtualedit=block      " select unwritten chars in visual-block mode
set hlsearch               " syntax highlighting on last search
set incsearch              " instant (char by char) search
set ignorecase             " ignore case when searching
set smartcase              " ignore case if search pattern is all lowercase,
                           " case-sensitive otherwise
set relativenumber         " relative line numbers
set background=dark        " light colors; more readable, but uglier
set bs=2                   " allow all backspacing in insert mode
set wildmode=longest,list  " bash-style tab-completion
set formatoptions+=or      " auto-insert comment characters
set title
set showmatch
set showcmd
set showtabline=2
set ruler                  " show the cursor position all the time
set showcmd                " display incomplete commands

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Highlight whitespace
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Show tabs
" set list
" set listchars=tab:>.,trail:.

"If your goal is to:
"
"    highlight trailing whitespace in red
"    have this highlighting not appear whilst you are typing in insert mode
"    have the highlighting of whitespace apply when you open new buffers
"
"then the following 6 commands are what you should put into your .vimrc. They are all listed on this page in separate sections, but this is a consolidated list of precisely what you need.
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Relaod .vimrc
nmap <F1> :so $MYVIMRC<CR>

" Set paste
set pastetoggle=<F2>

" tab/indenting options
filetype indent on   " per file indent
set autoindent       " new line starts indented
set cindent          " see help
set tabstop=4        " display width for old tab characters
set shiftwidth=4     " new tabs
set softtabstop=4    " how many spaces for tab key press

autocmd BufEnter *.sls set expandtab

" Brighter line numbers
highlight LineNr ctermfg=Grey

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

" Clear search buffer with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Juse jj for esc
inoremap jj <esc>

" Tab navigation like firefox
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
inoremap <C-j> <Esc>:tabprevious<CR>i
inoremap <C-k> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-w> <Esc>:tabclose<CR>

" Indention
nnoremap ø <<
nnoremap æ >>
vnoremap ø <
vnoremap æ >

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
