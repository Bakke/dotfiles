local servers = {
    'css-lsp',
    'html-lsp',
    'bash-language-server',
    'dockerfile-language-server',
    'docker-compose-language-service',
    'intelephense',
    'pyright',
    'svelte-language-server',
    'lua-language-server',
    'sqlls',
    'yaml-language-server',
    'vtsls',
    'vue-language-server',
    'twiggy-language-server',
}

-- Setup Mason
require("mason").setup({})

-- Ensure that the servers are installed
require('mason-tool-installer').setup({ ensure_installed = servers })

-- Enable servers
vim.lsp.enable(servers)

-- Set keymaps for LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- if client:supports_method('textDocument/completion') then
        --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        -- end

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=event.buf }
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, bufopts)

        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
        vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set('n', 'gj', vim.diagnostic.goto_next, bufopts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)

        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, bufopts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    end
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            -- [vim.diagnostic.severity.ERROR] = "✘ ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            -- [vim.diagnostic.severity.WARN] = "▲ ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            -- [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})
