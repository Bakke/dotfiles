" Enable vim enhanced functions
set nocompatible

" Set leader
let mapleader = ","

let g:AutoPairsShortcutToggle = 0
let g:AutoPairsShortcutFastWrap = 0
let g:AutoPairsShortcutJump = 0
let g:AutoPairsShortcutBackInsert = 0
let g:AutoPairsMultilineClose = 0

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Plugin Configuration ------------------------------------------------

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" Toggle NERD Tree
map <C-i> :NERDTreeToggle<CR>

" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

" indentLine
let g:indentLine_char = '⦙'

" Gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
	\ '*.git', '*.svg', '*.hg',
	\ '*/tests/*',
	\ 'build',
	\ 'dist',
	\ '*sites/*/files/*',
	\ 'bin',
	\ 'node_modules',
	\ 'bower_components',
	\ 'cache',
	\ 'compiled',
	\ 'docs',
	\ 'example',
	\ 'bundle',
	\ '*.md',
	\ '*-lock.json',
	\ '*.lock',
	\ '*bundle*.js',
	\ '*build*.js',
	\ '.*rc*',
	\ '*.json',
	\ '*.min.*',
	\ '*.map',
	\ '*.bak',
	\ '*.zip',
	\ '*.pyc',
	\ '*.class',
	\ '*.sln',
	\ '*.Master',
	\ '*.csproj',
	\ '*.tmp',
	\ '*.csproj.user',
	\ '*.cache',
	\ '*.pdb',
	\ 'tags*',
	\ 'cscope.*',
	\ '*.css',
	\ '*.less',
	\ '*.scss',
	\ '*.exe', '*.dll',
	\ '*.mp3', '*.ogg', '*.flac',
	\ '*.swp', '*.swo',
	\ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
	\ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
	\ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
	\ ]

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fix auto-indentation for YAML and JSON files
autocmd FileType yaml,yml,json setlocal ts=2 sts=2 sw=2 expandtab

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Emmet
" Use leader + tab for Emmet abbrevations
imap <silent> <leader><tab> <C-y>,

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Enable ale extension for airline
let g:airline#extensions#ale#enabled = 1

" Linting Vue
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

" Linitng PHP
let g:ale_php_phpcbf_standard = "PSR2"
let g:ale_php_phpcs_standard = "PSR2"

let g:vim_json_conceal=0

" Plugins -------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ludovicchabant/vim-gutentags'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Initialize plugin system
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%*

" Vim settings --------------------------------------------------------

set tags=./tags,tags;

" Syntax highlighting
syntax on
if has('termguicolors')
	set termguicolors
endif

let g:sonokai_style = 'maia'
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

" syntax on
" set t_Co=256
" set background=dark
" colorscheme dim

" Bash style tab completion
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
"set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildignore+=*/smarty/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu
set wildmode=list:longest

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

" PHP comment style
autocmd FileType php setlocal commentstring=//%s

" Vue comment style
autocmd FileType vue setlocal commentstring=//%s

" Disable right-hand scrollbar for vertically split window
set guioptions-=R

" Key mappings --------------------------------------------------------

" Relaod .vimrc
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Open .vimrc for editing
nmap <leader>v :edit $MYVIMRC<cr>

" Search for selected text or text under cursor (normal mode)
vnoremap // y/\V<C-R>"<CR>N
nnoremap // viwy/\V<C-R>"<CR>N

" Clear last search
nmap <silent> <leader>c <Esc>:let @/ = ""<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" Mappings for git
map <silent> <leader>gs :Git<CR>
map <silent> <leader>gd :Gvdiffsplit<CR>
map <silent> <leader>gp :Git push<CR>
map <silent> <leader>gl :Git pull<CR>
map <silent> <leader>gb :Git blame<CR>

set noswapfile
set nowritebackup
set nobackup

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undodir//

"fix search - normal regex can be used in searching
nnoremap / /\v
vnoremap / /\v

" Use jj for esc
inoremap jj <esc>

" Use gb to select last pasted text
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close buffers
nnoremap <C-q>     :bd!<CR>
nnoremap <C-w>     :bd<CR>
inoremap <C-q>     <Esc>:bd!<CR>
inoremap <C-w>     <Esc>:bd<CR>

" Next/previous buffer with Shift + H/L
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>

" Indention
nnoremap ø <<
nnoremap æ >>
vnoremap ø <
vnoremap æ >

" Next/prev lint error
nmap <silent> gk <Plug>(ale_previous_wrap)
nmap <silent> gj <Plug>(ale_next_wrap)

" Better mark jumping (line + col)
nnoremap ' `

autocmd FileType python map <buffer> <leader>e :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader>e <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

" Exclude dollar sign ($) from words in PHP
augroup PHP
    autocmd!
    autocmd FileType php setlocal iskeyword-=$
augroup END

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Pretty json
map <leader>j :%!python -m json.tool<CR>

" Turn off indentLine
nnoremap <leader>l :IndentLinesToggle<CR>

" Custom scripts ------------------------------------------------------

" Ripgrep command
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

" only use FZF shortcuts in non diff-mode
if !&diff
    nnoremap <C-p> :Files<Cr>
    nnoremap <C-g> :Rg<Cr>
    nnoremap <C-f> :BTags<Cr>
    nnoremap <leader>f :Tags<Cr>
    nnoremap <leader>ff yiw:Tags <C-R>"<CR>
    vnoremap <leader>f y:Tags <C-R>"<CR>
endif

" Strip whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Repeat macro over visually selected range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" CocVim --------------------------------------------------------------

" Use `gj` and `gk` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> gk <Plug>(coc-diagnostic-prev)
" nmap <silent> gj <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
