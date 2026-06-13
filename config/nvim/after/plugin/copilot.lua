-- Accept the current Copilot suggestion (g:copilot_no_tab_map is set in lua/plugins.lua)
vim.keymap.set("i", "<C-Space>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, silent = true })
