" nnoremap <silent><C-p> :Files<cr>
nnoremap <silent><C-p> :FilesWithDevicons<cr>
nnoremap <silent><C-f> :BLines<cr>
nnoremap <silent><C-g> :Commits<cr>
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
