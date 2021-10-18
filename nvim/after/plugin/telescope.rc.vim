if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent><C-p> :lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <silent><leader>g :lua require('telescope.builtin').live_grep<cr>
" nnoremap <silent><leader>f :lua require('telescope.builtin').file_browser<cr>
" nnoremap <silent> ;r :lua require('telescope.builtin').live_grep<cr>
" nnoremap <silent> \\ :lua require('telescope.builtin').buffers<cr>
" nnoremap <silent> ;; :lua require('telescope.builtin').help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
	defaults = {
		layout_config = {
			horizontal = { width = 0.95 },
		},
		file_ignore_patterns = {
			".git",
			".sass-cache",
			".DS_Store",
			"node_modules",
			"*.png",
			"*.jpg",
			"*.gif",
			"*.ico",
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-p>"] = false,
				["<C-n>"] = false,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	}
}
EOF
