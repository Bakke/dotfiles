local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<Tab>', api.tree.close, opts('Close'))
end

require'nvim-tree'.setup({
    on_attach = my_on_attach,
    view = {
        number = true,
        relativenumber = true
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

-- vim.keymap.set('n', '<C-i>', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
