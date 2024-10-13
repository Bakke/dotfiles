vim.api.nvim_set_keymap('i', '<C-Space>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

vim.g.copilot_no_tab_map = true

vim.g.copilot_filetypes = {
    json = true,
    yaml = true,
    markdown = true,
    gitcommit = true
}
