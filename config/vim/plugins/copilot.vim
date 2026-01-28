inoremap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

let g:copilot_filetypes = {
\ 'json': v:true,
\ 'yaml': v:true,
\ 'markdown': v:true,
\ 'gitcommit': v:true,
\ '*.env.*': v:false,
\ '*.env': v:false
\ }
