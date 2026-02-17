local copilot_chat = require("CopilotChat")

copilot_chat.setup {
    debug = false,
    model = 'claude-opus-4.6', -- AI model to use
    temperature = 0.1, -- Lower = focused, higher = creative
    -- window = {
    --     layout = 'vertical', -- 'vertical', 'horizontal', 'float'
    --     width = 0.5, -- 50% of screen width
    -- },
    auto_insert_mode = true, -- Enter insert mode when opening
    window = {
        layout = 'float',
        width = 0.6,
        height = 0.8,
        border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
        title = '🤖 AI Assistant',
        zindex = 100, -- Ensure window stays on top
    },

    headers = {
        user = '👤 You',
        assistant = '🤖 Copilot',
        tool = '🔧 Tool',
    },

    separator = '━━',
    auto_fold = true, -- Automatically folds non-assistant messages
}

-- Auto-command to customize chat buffer behavior
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = 'copilot-[^+.]+$',
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
        vim.opt_local.conceallevel = 0
    end,
})

vim.keymap.set('n', '<leader>a', copilot_chat.toggle)
vim.keymap.set('i', '<leader>a', copilot_chat.toggle)
vim.keymap.set('v', '<leader>a', copilot_chat.toggle)
