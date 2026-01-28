local fzf = require('fzf-lua')
local actions = fzf.actions
vim.g.fzf_history_dir = '~/.local/share/fzf-history'

fzf.setup({
    -- "hide",
    winopts = {
        height = 0.90,
        width = 0.90,
        preview = {
            vertical = 'down:45%',
            horizontal = 'right:50%',
        },
    },
    fzf_opts = {
        -- ["--layout"] = false,
    },
    files = {
        actions = {
            ["enter"] = actions.file_edit,
        },
        hidden = true,
        noignore = true,
        rg_opts = [[--color=never --hidden --no-ignore --files -g "!.git" -g "!node_modules" -g "!^plugins"]],
        fd_opts = [[--color=never --hidden --no-ignore --type f --type l --exclude .git --exclude node_modules --exclude /plugins/*]],
    },
    git = {
        commits = {
            actions = {
                ["enter"] = actions.git_buf_edit,
                -- ["enter"]  = actions.file_edit,
                -- ["ctrl-e"] = actions.git_buf_edit,
                ["ctrl-s"] = actions.git_buf_split,
                ["ctrl-v"] = actions.git_buf_vsplit,
                ["ctrl-t"] = actions.git_buf_tabedit,
                ["ctrl-y"] = { fn = actions.git_yank_commit, exec_silent = true },
            },
        },
    },
    lines = {
        previewer = 'hidden',
    },
    blines = {
        previewer = 'hidden',
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-p>', fzf.files, opts)
vim.keymap.set('n', '<C-f>', fzf.blines, opts)
vim.keymap.set('n', '<leader>r', fzf.grep_project, opts)
vim.keymap.set('n', '<leader>h', fzf.command_history, opts)
vim.keymap.set('n', '<leader>s', fzf.search_history, opts)
vim.keymap.set('n', '<leader>m', fzf.helptags, opts)
vim.keymap.set('n', '<leader>gc', fzf.git_commits, opts)
vim.keymap.set('n', '<leader>gf', fzf.git_bcommits, opts)
vim.keymap.set('n', '<leader>gb', fzf.git_branches, opts)
