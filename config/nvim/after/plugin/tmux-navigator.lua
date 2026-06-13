-- Seamless tmux/Neovim split navigation (vim-tmux-navigator)
-- Default mappings are disabled via g:tmux_navigator_no_mappings (see lua/plugins.lua)
local map = vim.keymap.set

map("n", "<M-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true, desc = "Navigate left" })
map("n", "<M-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true, desc = "Navigate down" })
map("n", "<M-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true, desc = "Navigate up" })
map("n", "<M-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true, desc = "Navigate right" })
