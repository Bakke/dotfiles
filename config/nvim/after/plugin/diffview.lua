require("diffview").setup({
    keymaps = {
        -- Keymaps active inside the side-by-side diff buffers
        view = {
            { "n", "cc", "<cmd>Git commit<cr>", { desc = "Git commit via Fugitive" } },
        },
        -- Keymaps active inside the file panel list sidebar
        file_panel = {
            { "n", "cc", "<cmd>Git commit<cr>", { desc = "Git commit via Fugitive" } },
        },
    }
})

vim.keymap.set('n', '<leader>gd', function()
    local lib = require("diffview.lib")
    local view = lib.get_current_view()

    if view then
        vim.cmd("DiffviewClose")
    else
        vim.cmd("DiffviewOpen")
    end
end, { desc = "Toggle Diffview" })
