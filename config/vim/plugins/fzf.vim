if has("nvim")
    finish
endif

if executable('devicon-lookup') == 0
    nnoremap <silent><C-p> :Files<cr>
else
    nnoremap <silent><C-p> :FilesWithDevicons<cr>
endif

nnoremap <silent><C-f> :BLines<cr>
nnoremap <silent><C-g> :Commits<cr>
nnoremap <leader>f :RG<cr>
nnoremap <leader>h :History:<cr>
nnoremap <leader>s :History/<cr>
nnoremap <leader>m :Helptags<cr>

let g:fzf_history_dir = '~/.local/share/fzf-history'
" let g:fzf_action = {
"     \ 'enter': 'tab split',
"     \ 'ctrl-t': 'tab split',
"     \ 'ctrl-x': 'split',
"     \ 'ctrl-v': 'vsplit' }
let g:fzf_preview_window = []
