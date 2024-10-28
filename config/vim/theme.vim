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
