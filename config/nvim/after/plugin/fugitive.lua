-- Git mappings (vim-fugitive)
local map = vim.keymap.set

map("n", "<leader>gs", "<cmd>Git<cr>", { silent = true, desc = "Git status" })
map("n", "<leader>gp", "<cmd>Git push<cr>", { silent = true, desc = "Git push" })
map("n", "<leader>gpf", "<cmd>Git push --force<cr>", { silent = true, desc = "Git push --force" })
map("n", "<leader>gl", "<cmd>Git pull<cr>", { silent = true, desc = "Git pull" })
map("n", "<leader>gh", "<cmd>Git log %<cr>", { silent = true, desc = "Git log (file)" })
map("n", "<leader>gg", "<cmd>Git log --oneline<cr>", { silent = true, desc = "Git log --oneline" })
