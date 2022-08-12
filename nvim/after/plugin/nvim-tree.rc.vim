" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <C-i> :NvimTreeToggle<CR>
nnoremap <Tab> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
local list = {
  { key = "<Tab>", action = "close" },
}
require'nvim-tree'.setup({
	view = {
        number = true,
        relativenumber = true,
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
        dotfiles = false,
        custom = {".git", "node_modules", ".cache"},
        exclude = {".env", ".gitignore"}
    }
})
EOF
