" Enable vim enhanced functions
set nocompatible

" Set leader
let mapleader = ","

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Init autocmd
autocmd!

runtime ./plug.vim

if has("unix")
	let s:uname = system("uname -s")
	" Do Mac stuff
	if s:uname == "Darwin\n"
		runtime ./macos.vim
	endif
endif

runtime ./settings.vim
runtime ./maps.vim

" Syntax highlighting
syntax on
if has('termguicolors')
	set termguicolors
endif

" let g:edge_style = 'aura'
" let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 1
let g:sonokai_style = 'maia'
let g:sonokai_disable_italic_comment = 1
let g:sonokai_better_performance = 1

colorscheme sonokai
" colorscheme edge

" set t_Co=256
" set background=dark
" colorscheme dim

" Fix auto-indentation for YAML and JSON files
autocmd FileType yaml,yml,json setlocal ts=2 sts=2 sw=2 expandtab

" PHP comment style
autocmd FileType php setlocal commentstring=//%s

" Vue comment style
autocmd FileType vue setlocal commentstring=//%s

" Strip whitespace on save
autocmd BufWritePre * %s/\s\+$//e
