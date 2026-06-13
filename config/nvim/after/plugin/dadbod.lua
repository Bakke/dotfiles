-- Run the current buffer as a database query (vim-dadbod)
vim.keymap.set({ "n", "x" }, "<leader>q", ":%DB<cr>", { desc = "Run buffer as DB query" })
