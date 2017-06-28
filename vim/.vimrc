" Enable vim enhanced functions
set nocompatible

" Set leader
:let mapleader = ","

let g:AutoPairsShortcutToggle = 0
let g:AutoPairsShortcutFastWrap = 0
let g:AutoPairsShortcutJump = 0
let g:AutoPairsShortcutBackInsert = 0

" Plugin Configuration ------------------------------------------------

" Hybrid theme
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Ctrp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
let g:ctrlp_max_files = 0 " Set no file limit, we are building a big project
let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
let g:ctrlp_working_path_mode = 0

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" Toggle tagbar
nmap <silent> <leader>t :TagbarToggle<CR>

" Toggle NERD Tree
map <C-i> :NERDTreeToggle<CR>

" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

" Open NERDTree automatically when vim starts up on opening a directory?
" Or just remove netrw
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ack
let g:ackhighlight = 1
let g:ack_default_options =
            \ " -s -H --nocolor --smart-case --nogroup --column"

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" CtrlPFunky
nnoremap <Leader>f :CtrlPFunky<Cr>

" Emmet
" Use leader + tab for Emmet abbrevations
imap <silent> <leader><tab> <C-y>,

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Indent Guides
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:mta_filetypes = {
    \ 'html': 1,
    \ 'vue': 1,
    \ 'xml': 1,
    \ 'jinja': 1,
    \ 'htmldjango': 1,
    \ 'php.html': 1,
    \}

" PHP DocBlockr
au BufRead,BufNewFile *.php inoremap <buffer> <C-B> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-B> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-B> :call PhpDocRange()<CR>

" Plugins -------------------------------------------------------------

" Vundle plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ConradIrwin/vim-bracketed-paste.git'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'ivalkeen/vim-ctrlp-tjump.git'
Plugin 'junegunn/vim-easy-align'
Plugin 'jwalton512/vim-blade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree.git'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0ng/vim-hybrid'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/MatchTagAlways'
Plugin 'wellle/targets.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'captbaritone/better-indent-support-for-php-with-html'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_scss_sass_quiet_messages = {
    \ "regex": 'File to import not found or unreadable', }

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

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


" Vim settings --------------------------------------------------------

" Syntax highlighting
syntax on
set t_Co=256
set background=dark
colorscheme hybrid_material

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

nnoremap <C-+> <C-W>+
nnoremap <C-+> <C-W>-

" Better mark jumping (line + col)
nnoremap ' `

" Yank from cursor to end of line
nnoremap Y y$

" Close Quickfix window
map <leader>qq :pclose<CR>
map <leader>ww :cclose<CR>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Custom scripts ------------------------------------------------------

" Strip whitespace on save
autocmd BufWritePre * %s/\s\+$//e

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

