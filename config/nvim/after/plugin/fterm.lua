require('FTerm').setup({
    border = 'rounded',
    dimensions = {
        height = 0.8,
        width = 0.8,
    },
})

-- Toggle terminal with Alt+i
vim.keymap.set('n', '<leader>t', '<CMD>lua require(\'FTerm\').toggle()<CR>')
vim.keymap.set('t', '<leader>t', '<C-\\><C-n><CMD>lua require(\'FTerm\').toggle()<CR>')
