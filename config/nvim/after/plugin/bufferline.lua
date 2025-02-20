require("bufferline").setup {
    options = {
        numbers = "none",
        indicator = {
            style = "none",
        },
        color_icons = true,
        always_show_bufferline = true,
        buffer_close_icon = ' ',
        modified_icon = '●',
        close_icon = '',
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        max_name_length = 40,
        separator_style = "thin",
        show_tab_indicators = false,
        persist_buffer_sort = false,
    },
    highlights = {
        buffer_selected = {
            bold = false,
            italic = false,
        },
        separator_selected = {
            fg = '#3A444B',
        },
        separator = {
            fg = '#3A444B',
        },
        separator_visible = {
            fg = '#3A444B',
        }
    }
}

vim.keymap.set('n', '<C-left>', function() require"bufferline".move(-1) end, { noremap = true, silent = true })
vim.keymap.set('n', '<C-right>', function() require"bufferline".move(1) end, { noremap = true, silent = true })
vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
