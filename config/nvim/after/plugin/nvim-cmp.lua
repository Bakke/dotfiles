local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local select_opts = {behavior = cmp.SelectBehavior.Select}

-- cmp_autopairs.setup({
-- 	map_cr = true, --  map <CR> on insert mode
-- 	map_complete = true -- it will auto insert `(` after select function or method item
-- })

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    preselect = cmp.PreselectMode.Item,
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    sources = {
        { name = 'path', keyword_length = 2 },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer', keyword_length = 2 },
    },
    window = {
        -- completion = {
        --     border = true,
        -- },
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    -- formatting = {
    --     fields = {'menu', 'abbr', 'kind'}
    -- },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            preset = 'codicons',
            menu = ({
                path = "[Path]",
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
            })
        }),
    },
    completion = {
        -- completeopt = 'menu,menuone,noinsert'
        completeopt = 'menu,menuone'
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        -- ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        -- ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-e>'] = cmp.mapping.abort(),

        ['<C-j>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),

        ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
})
