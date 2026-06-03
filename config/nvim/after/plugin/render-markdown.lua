local render_markdown = require('render-markdown')

render_markdown.setup({
    -- enabled = false,
    file_types = { 'markdown', 'codecompanion' },
    completions = {
        lsp = {
            enabled = true
        }
    },
    checkbox = {
        -- checked = {
        --     scope_highlight = '@markup.strikethrough'
        -- },
        custom = {
            important = { raw = '[~]', rendered = '󰓎  ', highlight = 'DiagnosticWarn', scope_highlight = nil },
        },
    },
    latex = { enabled = false },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>m', render_markdown.buf_toggle, opts)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()

        vim.keymap.set('n', '<C-Space>', function()
            local line = vim.api.nvim_get_current_line()
            local updated_line, update_count

            local patterns = {
                { pattern = '%-%s*%[%s*%]', replacement = '- [x]' },
                { pattern = '%-%s*%[%s*[xX]%s*%]', replacement = '- [-]' },
                { pattern = '%-%s*%[%s*[%-]%s*%]', replacement = '- [~]' },
                { pattern = '%-%s*%[%s*[%~]%s*%]', replacement = '- [ ]' },
            }

            for _, p in ipairs(patterns) do
                if line:match(p.pattern) then
                    updated_line, update_count = line:gsub(p.pattern, p.replacement, 1)
                    break
                end
            end

            if update_count and update_count > 0 then
                vim.api.nvim_set_current_line(updated_line)
            end
        end, { buffer = true, desc = 'Toggle Markdown Checkbox' })

    end,
})
