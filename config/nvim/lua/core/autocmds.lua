-- Autocommands (migrated from the old Vim autocmd.vim and settings.vim)

local augroup = vim.api.nvim_create_augroup("dotfiles", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Check for external file changes when the cursor is idle (pairs with autoread)
autocmd("CursorHold", {
    group = augroup,
    pattern = "*",
    command = "checktime",
})

-- Two-space indentation for YAML and JSON
autocmd("FileType", {
    group = augroup,
    pattern = { "yaml", "yml", "json" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
    end,
})

-- Detect nginx config files that have no filetype
autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = { "/etc/nginx/*", "/usr/local/nginx/conf/*" },
    callback = function()
        if vim.bo.filetype == "" then
            vim.bo.filetype = "nginx"
        end
    end,
})

-- Treat .env files as shell scripts
autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = { ".env", ".env.*" },
    callback = function()
        vim.bo.filetype = "sh"
    end,
})

-- EDIFACT detection
autocmd("FileType", {
    group = augroup,
    pattern = { "edifact", "edi", "EDIFACT", "EDI" },
    callback = function()
        vim.bo.filetype = "edifact"
    end,
})

-- Skeleton files for new buffers
autocmd("BufNewFile", {
    group = augroup,
    pattern = "*.sh",
    command = "0r ~/.dotfiles/config/vim/skeletons/bash.sh",
})
autocmd("BufNewFile", {
    group = augroup,
    pattern = "*.php",
    command = "0r ~/.dotfiles/config/vim/skeletons/php.php",
})

-- In fugitive buffers, jump to the next/previous hunk with <C-j>/<C-k>
autocmd("FileType", {
    group = augroup,
    pattern = "fugitive",
    callback = function(ev)
        vim.keymap.set("n", "<C-k>", "(", { buffer = ev.buf, remap = true })
        vim.keymap.set("n", "<C-j>", ")", { buffer = ev.buf, remap = true })
    end,
})
