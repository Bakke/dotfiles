" let g:AutoPairsShortcutToggle = 0
" let g:AutoPairsShortcutFastWrap = 0
" let g:AutoPairsShortcutJump = 0
" let g:AutoPairsShortcutBackInsert = 0
" let g:AutoPairsMultilineClose = 0

lua << EOF

require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true -- it will auto insert `(` after select function or method item
})

EOF
