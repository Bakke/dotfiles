let g:indent_blankline_disable_warning_message = v:true

let g:indent_blankline_char = '⦙'
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_context_patterns = ['class', 'function', 'method', 'if', 'for', 'foreach', 'while']

highlight IndentOdd guibg=NONE guifg=#82878B gui=nocombine
highlight IndentEven guibg=NONE guifg=#5D6064 gui=nocombine
let g:indent_blankline_char_highlight_list = ['IndentOdd', 'IndentEven']
let g:indent_blankline_space_char_highlight_list = ['IndentOdd', 'IndentEven']
