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
set wrap                        " Wrap long lines
set linebreak                   " Do not break lines inside words
set noshowmode                  " Don't show the current mode (airline.vim takes care of us)
set magic                       " Enable extended regexes
set hidden                      " Enable hidden buffers
set autoread                    " Auto reload files that are changed outside vim
au CursorHold * checktime
set scrolloff=3                 " Start scrolling three lines before horizontal border of window
set ttyfast                     " Sends more characters at a time
set foldmethod=indent
set nofoldenable

" Indention
filetype indent on
set autoindent                  " Copy indent from last line when starting new line
set expandtab                   " Expand tabs to spaces
set smarttab                    " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set shiftwidth=4                " Number of spaces for indenting
set softtabstop=4               " Pressing tab key results in 4 spaces

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

" Disable mouse
set mouse=

set noswapfile
set nowritebackup
set nobackup

" persist the undo tree for each file
set undofile
set undodir=~/.vim/undo-dir

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Delete comment character when joining commented lines
set formatoptions+=j
