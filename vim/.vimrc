" Enable vim enhanced functions
set nocompatible

" Set leader
:let mapleader = ","

let g:AutoPairsShortcutToggle = 0
let g:AutoPairsShortcutFastWrap = 0
let g:AutoPairsShortcutJump = 0
let g:AutoPairsShortcutBackInsert = 0

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Plugin Configuration ------------------------------------------------

" Hybrid theme
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" Toggle NERD Tree
map <C-i> :NERDTreeToggle<CR>

" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

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

" Fix auto-indentation for YAML files
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

augroup LargeFile
    let g:large_file = 104857600 " 100MB

    " Set options:
    "   eventignore+=FileType (no syntax highlighting etc
    "   assumes FileType always on)
    "   noswapfile (save copy of file)
    "   bufhidden=unload (save memory when other file is viewed)
    "   buftype=nowritefile (is read-only)
    "   undolevels=-1 (no undo possible)
    au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                    \ set eventignore+=FileType |
                    \ setlocal nowrap noswapfile bufhidden=unload undolevels=-1 |
                \ else |
                    \ set eventignore-=FileType |
                \ endif
augroup END

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Emmet
" Use leader + tab for Emmet abbrevations
imap <silent> <leader><tab> <C-y>,
let g:user_emmet_settings = {
			\  'javascript.jsx' : {
			\      'extends' : 'jsx',
			\  },
			\}

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Indent Guides
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:mta_filetypes = {
    \ 'html': 1,
    \ 'vue': 1,
    \ 'jsx': 1,
    \ 'xml': 1,
    \ 'jinja': 1,
    \ 'php': 1,
    \}

" Enable ale extension for airline
let g:airline#extensions#ale#enabled = 1

" Ale linting jsx support
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Linting jsx
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

" Linting Vue
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls']}

" Linitng PHP
let g:ale_php_phpcbf_standard = "PSR2"
let g:ale_php_phpcs_standard = "PSR2"

" PHP DocBlockr
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
let g:pdv_cfg_Author = 'Magnus Hauge Bakke <magnus@idrift.no>'

" PHP DocBlockr keybindings
au BufRead,BufNewFile *.php inoremap <buffer> <C-B> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-B> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-B> :call PhpDocRange()<CR>

" Plugins -------------------------------------------------------------

" Vundle plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set rtp+=~/.fzf

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ConradIrwin/vim-bracketed-paste.git'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'junegunn/vim-easy-align'
Plugin 'jwalton512/vim-blade'
"Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'jeffkreeftmeijer/vim-dim'
Plugin 'mattn/emmet-vim'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree.git'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'tobyS/pdv'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/MatchTagAlways'
Plugin 'wellle/targets.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'vim-vdebug/vdebug'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'saltstack/salt-vim'
Plugin 'stephpy/vim-yaml'
Plugin 'Glench/Vim-Jinja2-Syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%*

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#min_keyword_length = 3

" NeoSnippets
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#snippets_directory='~/.dotfiles/vim/snippets'

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : neocomplete#start_manual_complete()

smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"

function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

" For conceal markers.
" if has('conceal')
"     set conceallevel=2 concealcursor=niv
" endif

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

if !exists('g:vdebug_options')
    let g:vdebug_options = {}
endif

let g:vdebug_options["break_on_open"]=0
let g:vdebug_options["path_maps"] = {"/home/vagrant/code": "/Users/magnus/Development/vhost"}


" Vim settings --------------------------------------------------------

set tags=./tags,tags;

" Syntax highlighting
syntax on
set t_Co=256
set background=dark
colorscheme dim
" colorscheme hybrid_material

" Bash style tab completion
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
"set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildignore+=*/smarty/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu
set wildmode=list:longest

" Show tabs and trailing spaces
" set list
set listchars=tab:›.,trail:.,extends:#,nbsp:.

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
set mouse=a                     " Enable mouse in all in all modes
set ttymouse=xterm              " Set mouse type to xterm
set ttyfast                     " Sends more characters at a time
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

" Disable right-hand scrollbar for vertically split window
set guioptions-=R

" Abbreviations -------------------------------------------------------
ab teh the

" Key mappings --------------------------------------------------------

" Relaod .vimrc
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Open .vimrc for editing
nmap <leader>v :edit $MYVIMRC<cr>

" Start editing before second doublequote
nmap <leader>" 2f"i

" Start editing before second singlequote
nmap <leader>" 2f'i

" Search for selected text or text under cursor (normal mode)
vnoremap // y/\V<C-R>"<CR>N
nnoremap // viwy/\V<C-R>"<CR>N

" Clear last search
nmap <silent> <leader>c <Esc>:let @/ = ""<CR>

" Show tabs and trailing whitespace
nmap <silent> <Leader>tt <Esc>:set list!<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" Mappings for git
map <silent> <leader>gs :Gstatus<CR>
map <silent> <leader>gd :Gdiff<CR>
map <silent> <leader>gp :Gpush<CR>
map <silent> <leader>gl :Gpull<CR>
map <silent> <leader>gb :Gblame<CR>

" .viminfo settings
" read/write a .viminfo file, don't store more that 50 lines of registers
set viminfo='20,\"50
set history=1000
set nobackup
set noswapfile

"undo stuff
"location of undo files
if exists("+undodir")
    set undodir=~/.vimundo
    "save an undo file - persistent undo
    set undofile
    "max number of changes that can be undone
    set undolevels=1000
    "undo on reload
    set undoreload=10000
endif

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

" Yank from cursor to end of line
nnoremap Y y$

" Close Quickfix window
map <leader>qq :pclose<CR>
map <leader>ww :cclose<CR>

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

augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

nnoremap <C-l> za

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

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

