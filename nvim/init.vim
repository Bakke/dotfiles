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

let g:sonokai_style = 'maia'
let g:sonokai_transparent_background = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_better_performance = 1
let g:sonokai_diagnostic_text_highlight = 1
" let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'colored'

colorscheme sonokai

let g:PHP_noArrowMatching = 1

" Fix auto-indentation for YAML and JSON files
autocmd FileType yaml,yml,json setlocal ts=2 sts=2 sw=2 expandtab

" PHP comment style
autocmd FileType php setlocal commentstring=//%s

" Vue comment style
autocmd FileType vue setlocal commentstring=//%s

autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
autocmd BufRead,BufNewFile .env* if &ft == '' | setfiletype bash | endif

augroup filetypedetect
	autocmd FileType edifact,edi,EDIFACT,EDI setlocal filetype=edifact
augroup END

" Skeleton files
autocmd BufNewFile *.sh 0r ~/.config/nvim/skeletons/bash.sh
autocmd BufNewFile *.php 0r ~/.config/nvim/skeletons/php.php

" Strip whitespace on save
autocmd BufWritePre * %s/\s\+$//e
