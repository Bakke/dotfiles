-- Colorscheme (migrated from the old Vim theme.vim)

vim.opt.termguicolors = true

-- Sonokai settings (must be set before the colorscheme is applied)
vim.g.sonokai_style = "maia"
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_better_performance = 1
vim.g.sonokai_diagnostic_text_highlight = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"

vim.cmd.colorscheme("sonokai")
