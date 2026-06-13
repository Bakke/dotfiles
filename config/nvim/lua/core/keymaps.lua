-- Key mappings (migrated from the old Vim maps.vim)
--
-- Plugin-specific mappings live with their plugin spec in lua/plugins.lua
-- (fugitive, easy-align, emmet, dadbod, tmux-navigator, yazi) or in the
-- relevant after/plugin/*.lua file (fzf-lua, bufferline, render-markdown, ...).

local map = vim.keymap.set
local silent = { silent = true }

-- Update plugins (was :PlugUpdate)
map("n", "<leader>p", "<cmd>Lazy sync<cr>", { desc = "Update plugins" })

-- Clear the last search highlight
map("n", "<leader>cc", "<cmd>nohlsearch<bar>diffupdate<cr><C-l>", silent)

-- Copy to the system clipboard
map("x", "<C-c>", '"+y', silent)
map("n", "<C-c>", '"+yiw', silent)
map("n", "<leader>cf", function() vim.fn.setreg("+", vim.fn.expand("%:t")) end, { desc = "Copy filename" })
map("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = "Copy file path" })

-- Use <C-i> to increment numbers (note: native `g<C-a>` makes sequences in
-- visual mode, replacing the old vim-visual-increment script).
map({ "n", "v", "s", "x" }, "<C-i>", "<C-a>")

-- In the command-line popup menu, navigate with <C-j>/<C-k>
if vim.tbl_contains(vim.opt.wildoptions:get(), "pum") then
    map("c", "<C-k>", function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>" end, { expr = true })
    map("c", "<C-j>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>" end, { expr = true })
end

-- Save and close the window, then move down (tmux-aware)
map("", "<leader>w", "<M-h> ZZ <M-j> <Enter> <M-j>", { remap = true, silent = true })

-- Use "very magic" regex by default when searching
map({ "n", "x" }, "/", "/\\v")

-- Search for the selected text / word under the cursor
map("x", "//", 'y/\\V<C-R>"<CR>N', silent)
map("n", "//", 'viwy/\\V<C-R>"<CR>N', silent)

-- Ripgrep the word under the cursor and highlight it
map("n", "<M-/>", 'viwy:Rg <C-R>"<CR>/\\V<C-R>"<CR>')

-- Search for quoted strings (legacy helpers)
map("n", '/"', '\\"\\zs(\\s)@![^\\"]+(\\s)@<!\\ze\\"<CR>N')
map("n", "/'", "\\'\\zs(\\s)@![^\\']+(\\s)@<!\\ze\\'<CR>N")

-- Use jj to leave insert mode
map("i", "jj", "<esc>", silent)

-- Reselect the last pasted text with gp
map("n", "gp", function()
    return "`[" .. string.sub(vim.fn.getregtype(), 1, 1) .. "`]"
end, { expr = true })

-- Close buffers
map("n", "<C-q>", "<cmd>bd!<cr>", silent)
map("n", "<C-w>", "<cmd>bd<cr>", silent)
map("i", "<C-q>", "<Esc><cmd>bd!<cr>", silent)
map("i", "<C-w>", "<Esc><cmd>bd<cr>", silent)

-- Indentation with the Norwegian bracket keys
map("n", "ø", "<<")
map("n", "æ", ">>")
map("x", "ø", "<")
map("x", "æ", ">")

-- Jump to mark line and column with '
map("n", "'", "`")

-- Pretty-print JSON
map({ "n", "x" }, "<leader>j", "<cmd>%!python3 -m json.tool<cr>", silent)

-- Insert a UUID (replaces the old Vim :py uuid mapping)
local function insert_uuid()
    local uuid = vim.fn.system("uuidgen"):gsub("%s+$", "")
    vim.api.nvim_put({ uuid }, "c", true, true)
end
map("n", "<leader>u", insert_uuid, { desc = "Insert UUID" })
map("i", "<leader>u", function()
    insert_uuid()
    vim.cmd("startinsert")
end, { desc = "Insert UUID" })

-- Resize splits with Alt + arrow keys
map("n", "<M-Up>", "<cmd>resize +2<cr>", silent)
map("n", "<M-Down>", "<cmd>resize -2<cr>", silent)
map("n", "<M-Left>", "<cmd>vertical resize +2<cr>", silent)
map("n", "<M-Right>", "<cmd>vertical resize -2<cr>", silent)

-- Run a macro over each line of the visual selection
vim.keymap.set('x', '@', function()
    return ':norm @' .. vim.fn.getcharstr() .. '<CR>'
end, { expr = true, desc = "Run macro over visual selection" })
