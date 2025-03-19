" Status line
if !exists('*fugitive#statusline')
	set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
	set statusline+=%=
	set statusline+=%{fugitive#statusline()}
endif

" Jump to next/previous file, hunk, or revision with Ctrl-j/k 
autocmd FileType fugitive nmap <buffer> <C-k> (
autocmd FileType fugitive nmap <buffer> <C-j> )
