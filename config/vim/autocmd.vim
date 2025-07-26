" Fix auto-indentation for YAML and JSON files
autocmd FileType yaml,yml,json setlocal ts=2 sts=2 sw=2 expandtab

" PHP comment style
" autocmd FileType php setlocal commentstring=//%s

" Vue comment style
" autocmd FileType vue setlocal commentstring=//%s

autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
autocmd BufRead,BufNewFile .env* if &ft == '' | setfiletype bash | endif

augroup filetypedetect
	autocmd FileType edifact,edi,EDIFACT,EDI setlocal filetype=edifact
augroup END

" Enable autocompletion for DBUI 
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

" Skeleton files
autocmd BufNewFile *.sh 0r ~/.dotfiles/config/vim/skeletons/bash.sh
autocmd BufNewFile *.php 0r ~/.dotfiles/config/vim/skeletons/php.php

" Strip whitespace on save
" autocmd BufWritePre * %s/\s\+$//e
