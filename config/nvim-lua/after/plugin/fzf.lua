local keymapOptions = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-p>', ':Files<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<C-p>', ':FilesWithDevicons<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<C-f>', ':BLines<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<C-g>', ':Commits<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<leader>f', ':RG<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<leader>h', ':History:<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<leader>s', ':History/<cr>', keymapOptions)
vim.api.nvim_set_keymap('n', '<leader>m', ':Helptags<cr>', keymapOptions)

vim.g.fzf_history_dir = '~/.local/share/fzf-history'
-- vim.g.fzf_action = {
--     enter = 'tab split',
--     ['ctrl-t'] = 'tab split',
--     ['ctrl-x'] = 'split',
--     ['ctrl-v'] = 'vsplit'
-- }
vim.g.fzf_preview_window = {}
