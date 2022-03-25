" nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-i> :NvimTreeToggle<CR>
" nnoremap <Tab> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = "<C-i>",                            cb = tree_cb("close") },
}
require'nvim-tree'.setup({
	view = {
		mappings = {
			list = list
		}
	},
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
    filters = {
        custom = {".git", "node_modules", ".cache"}
    }
})
EOF
