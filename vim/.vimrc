" Enable vim enhanced functions
set nocompatible

" Set leader
:let mapleader = ","

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

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ConradIrwin/vim-bracketed-paste.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'jdkanani/vim-material-theme.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Bash style tab completion
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu
set wildmode=list:longest,full

" Syntax highlighting
syntax on
set t_Co=256
silent! colorscheme material-theme
set background=dark
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

" Searching
set hlsearch                    " Syntax highlighting on last search
set incsearch                   " Instant (char by char) search
set ignorecase                  " Ignore case when searching
set smartcase                   " Ignore case if search pattern is all lowercase, case-sensitive otherwise

" Editing options
set laststatus=2                " Always show statusline
set relativenumber              " Use relative line numbers. Current line is still in status bar.
set title                       " Show the filename in the window titlebar
set showtabline=2               " Always show tab bar
set ruler                       " Show the cursor position all the time
set showcmd                     " Display incomplete commands
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set visualbell                  " Use visual bell instead of audible bell (annnnnoying)
set noshowmode                  " Don't show the current mode (airline.vim takes care of us)
set magic                       " Enable extended regexes

" tab/indenting options
filetype indent on              " per file indent
set autoindent                  " new line starts indented
set tabstop=4                   " display width for old tab characters
set shiftwidth=4                " new tabs
set softtabstop=4               " how many spaces for tab key press

" Split options
set splitbelow
set splitright

" Format options
set formatoptions=
set formatoptions+=c            " Format comments
set formatoptions+=r            " Continue comments by default
set formatoptions+=o            " Make comment when using o or O from comment line
set formatoptions+=q            " Format comments with gq
set formatoptions+=n            " Recognize numbered lists
set formatoptions+=2            " Use indent from 2nd line of a paragraph
set formatoptions+=l            " Don't break lines that are already long
set formatoptions+=1            " Break before 1-letter words

" Autocompletion
filetype plugin on
set ofu=syntaxcomplete#Complete " Set omni-completion method

" Relaod .vimrc
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Clear last search
nmap <silent> <leader>c <Esc>:noh<CR>

" .viminfo settings
" read/write a .viminfo file, don't store more that 50 lines of registers
set viminfo='20,\"50
set history=50

" Juse jj for esc
inoremap jj <esc>

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open and close tabs
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-w>     :tabclose<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-w>     <Esc>:tabclose<CR>

" Next/previous tab with Shift + H/L
nnoremap H gT
nnoremap L gt

" Indention
nnoremap ø <<
nnoremap æ >>
vnoremap ø <
vnoremap æ >

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

