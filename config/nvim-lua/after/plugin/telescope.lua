if not package.loaded['telescope'] then
    return
end

vim.api.nvim_set_keymap('n', '<C-p>', require("telescope.builtin").find_files({ hidden = true, previewer = false }), { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', require("telescope.builtin").live_grep(), { noremap = true, silent = true })

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
			"^node_modules",
			"^vendor",
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
