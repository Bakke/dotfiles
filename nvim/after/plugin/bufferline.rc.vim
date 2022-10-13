set termguicolors
lua << EOF
require("bufferline").setup {
    options = {
        color_icons = true,
        always_show_bufferline = true,
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        show_close_icon = false,
        show_buffer_close_icons = false,
        max_name_length = 40,
    }
}
EOF
