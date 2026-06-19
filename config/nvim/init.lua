-- Neovim configuration (pure Lua)
--
-- Entry point. Loads, in order:
--   1. Leader keys (must be set before plugins are loaded)
--   2. Core editor options
--   3. Plugins (managed by lazy.nvim)
--   4. Keymaps, autocommands and colorscheme
--   5. LSP configuration
--
-- Plugin-specific configuration lives in `after/plugin/*.lua` (auto-sourced
-- once the plugins are on the runtimepath) and in `lua/plugins.lua`.

-- Leader keys. Set these before lazy.nvim so plugin mappings pick them up.
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("core.options")

-- Bootstrap and configure the plugin manager.
require("core.lazy")

require("core.keymaps")
require("core.autocmds")
require("core.theme")
require("core.lsp")
