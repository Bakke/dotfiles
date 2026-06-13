-- Start interactive EasyAlign in normal/visual mode (e.g. gaip, vipga)
vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)", { remap = true, desc = "EasyAlign" })
