" Enable vim enhanced functions
set nocompatible

" Set leader
:let mapleader = ","

" Ctrp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
let g:ctrlp_max_files = 0 " Set no file limit, we are building a big project
let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one

" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" Toggle tagbar
nmap <silent> <leader>t :TagbarToggle<CR>

" Toggle NERD Tree
map <C-i> :NERDTreeToggle<CR>

" NERD Tree settings
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

" Open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Indent guides options
let g:indent_guides_default_mapping = 0
nmap <silent> <Leader>tt <Plug>IndentGuidesToggle

" Use leader + tab for Emmet abbrevations
imap <silent> <leader><tab> <C-y>,

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
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive.git'
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'jwalton512/vim-blade'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'w0ng/vim-hybrid'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'majutsushi/tagbar'

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

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Syntax highlighting
syntax on
set t_Co=256
"silent! colorscheme hybrid
silent! colorscheme hybrid_material
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
set hidden                      " Enable hidden buffers

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

" PHP DocBlockr
au BufRead,BufNewFile *.php inoremap <buffer> <C-B> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <buffer> <C-B> :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <buffer> <C-B> :call PhpDocRange()<CR>

" Autocompletion
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <expr> <tab> TabComplete()
smap <expr> <tab> TabComplete()
xmap <expr> <tab> TabComplete()

" Custom function for tab completion
" Checks if we should youse neocomplete or emmet
function! TabComplete()
	if &filetype =~ 'html\|php\|css\|scss\|less' && IsEmmetExpandable()
		return "\<plug>(emmet-expand-abbr)"
	elseif pumvisible()
		return "\<c-n>"
	else
		return "\<tab>"
	endif
endfunction

" Custom function to check if
" string is expandable by emmet
function! IsEmmetExpandable()
	if !emmet#isExpandable() | return 0 | endif
	if &filetype =~ 'css' | return 1 | endif
	if &filetype =~ 'less' | return 1 | endif
	if &filetype =~ 'scss' | return 1 | endif

	let expr = matchstr(getline('.')[:col('.')], '\(\S\+\)$')
	return expr =~ '[.#>+*]' || index(s:emmetElements, expr) >= 0
endfunction

" HTML elements Emmet should recognize
let s:emmetElements = ['a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside', 'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'big', 'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite', 'code', 'col', 'colgroup', 'datalist', 'dd', 'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'em', 'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form', 'frame', 'frameset', 'h1', 'head', 'header', 'hr', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'main', 'map', 'mark', 'menu', 'menuitem', 'meta', 'meter', 'nav', 'noframes', 'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param', 'pre', 'progress', 'q', 'rp', 'rt', 'ruby', 's', 'samp', 'script', 'section', 'select', 'small', 'source', 'span', 'strike', 'strong', 'style', 'sub', 'summary', 'sup', 'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul', 'var', 'video', 'wbr']
      \ + ['emb', 'btn', 'sty', 'dlg', 'fst', 'fig', 'leg', 'tarea', 'hdr', 'cmd', 'colg', 'art', 'fset', 'src', 'prog', 'bq', 'kg', 'adr' , 'cap', 'datag', 'datal', 'sect', 'str', 'obj', 'ftr', 'optg', 'ifr', 'out', 'det', 'acr', 'opt']

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
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

"Disable neocomplete when multiple cursors are active
function! Multiple_cursors_before()
	exe 'NeoCompleteLock'
endfunction

"Enable neocomplete when multiple cursors are done
function! Multiple_cursors_after()
	exe 'NeoCompleteUnlock'
endfunction

" Relaod .vimrc
nmap <silent> <leader>r :so $MYVIMRC<CR>

" Clear last search
nmap <silent> <leader>c <Esc>:let @/ = ""<CR>

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
set history=50

" Juse jj for esc
inoremap jj <esc>

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close buffers
nnoremap <C-q>     :bw!<CR>
nnoremap <C-w>     :bw<CR>
inoremap <C-q>     <Esc>:bw!<CR>
inoremap <C-w>     <Esc>:bw<CR>

" Next/previous buffer with Shift + H/L
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>

" Indention
nnoremap ø <<
nnoremap æ >>
vnoremap ø <
vnoremap æ >

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Strip whitespace on save
autocmd BufEnter * EnableStripWhitespaceOnSave

" Better indent support for PHP by making it possible to indent HTML sections
" as well.
if exists("b:did_indent")
  finish
endif
" This script pulls in the default indent/php.vim with the :runtime command
" which could re-run this script recursively unless we catch that:
if exists('s:doing_indent_inits')
  finish
endif
let s:doing_indent_inits = 1
runtime! indent/html.vim
unlet b:did_indent
runtime! indent/php.vim
unlet s:doing_indent_inits
function! GetPhpHtmlIndent(lnum)
	if exists('*HtmlIndent')
		let html_ind = HtmlIndent()
	else
		let html_ind = HtmlIndentGet(a:lnum)
	endif
	let php_ind = GetPhpIndent()
	" priority one for php indent script
	if php_ind > -1
		return php_ind
	endif
	if html_ind > -1
		if getline(a:num) =~ "^<?" && (0< searchpair('<?', '', '?>', 'nWb')
					\ || 0 < searchpair('<?', '', '?>', 'nW'))
			return -1
		endif
		return html_ind
	endif
	return -1
endfunction
setlocal indentexpr=GetPhpHtmlIndent(v:lnum)
setlocal indentkeys+=<>>

