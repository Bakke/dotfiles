-- Bootstrap the lazy.nvim plugin manager and load the plugin specs.
-- Replaces the old vim-plug setup (config/vim/plug.vim).

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"), {
    -- Plugins are configured eagerly in after/plugin/*.lua, so don't lazy-load
    -- them by default.
    defaults = { lazy = false },
    change_detection = { notify = false },
})
