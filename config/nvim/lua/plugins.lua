-- Plugin specifications for lazy.nvim (migrated from config/vim/plug.vim).
--
-- Heavy plugin configuration lives in `after/plugin/<name>.lua`, which is
-- auto-sourced after startup. Only small, plugin-specific settings and
-- mappings that used to live in config/vim/plugins/*.vim are inlined here.

return {
    -----------------------------------------------------------------------
    -- Editing / motions / text objects
    -----------------------------------------------------------------------
    "ConradIrwin/vim-bracketed-paste", -- Handle bracketed paste automatically
    "tpope/vim-repeat",                -- Repeat plugin maps with `.`
    "tpope/vim-surround",              -- Add/change/delete surrounding pairs
    "tpope/vim-abolish",               -- Smart substitution and case coercion
    "wellle/targets.vim",              -- Extra text objects
    "monaqa/dial.nvim",                -- Increment/decrement with various "augends" (config: after/plugin/dial.lua)

    "junegunn/vim-easy-align", -- Align text on a delimiter (maps: after/plugin/easy-align.lua)
    "mattn/emmet-vim",         -- HTML/CSS abbreviation expansion (maps: after/plugin/emmet.lua)

    {
        "editorconfig/editorconfig-vim", -- Respect .editorconfig files
        init = function()
            vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*" }
        end,
    },

    -----------------------------------------------------------------------
    -- Git
    -----------------------------------------------------------------------
    "sindrets/diffview.nvim", -- Git diff viewer (config: after/plugin/diffview.lua)
    "tpope/vim-fugitive",     -- Git wrapper (maps: after/plugin/fugitive.lua)

    -----------------------------------------------------------------------
    -- Database
    -----------------------------------------------------------------------
    "tpope/vim-dadbod", -- Run database queries from the buffer (maps: after/plugin/dadbod.lua)

    -----------------------------------------------------------------------
    -- Search
    -----------------------------------------------------------------------
    {
        "jremmen/vim-ripgrep", -- :Rg command (used by some search mappings)
        cmd = "Rg",
    },

    -----------------------------------------------------------------------
    -- Tmux integration
    -----------------------------------------------------------------------
    {
        "christoomey/vim-tmux-navigator", -- Seamless tmux/Neovim split navigation (maps: after/plugin/tmux-navigator.lua)
        init = function()
            vim.g.tmux_navigator_no_mappings = 1
        end,
    },

    -----------------------------------------------------------------------
    -- Filetypes / syntax
    -----------------------------------------------------------------------
    "jwalton512/vim-blade",  -- Laravel Blade templates
    "vim-scripts/edifact.vim", -- EDIFACT files
    "Fymyte/rasi.vim",       -- Rofi .rasi files
    "fei6409/log-highlight.nvim", -- Highlight log files

    -----------------------------------------------------------------------
    -- Colorscheme
    -----------------------------------------------------------------------
    {
        "sainnhe/sonokai",
        priority = 1000, -- Load before other UI plugins; applied in core/theme.lua
    },

    -----------------------------------------------------------------------
    -- UI
    -----------------------------------------------------------------------
    "nvim-tree/nvim-web-devicons", -- File icons
    {
        "nvim-tree/nvim-tree.lua",  -- File explorer (config: after/plugin/nvim-tree.lua)
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    "mikavilpas/yazi.nvim", -- Yazi file manager integration (maps: after/plugin/yazi.lua)
    "nvim-lualine/lualine.nvim",   -- Statusline (config: after/plugin/lualine.lua)
    {
        "akinsho/bufferline.nvim",  -- Buffer/tab line (config: after/plugin/bufferline.lua)
        version = "v4.*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    "lukas-reineke/indent-blankline.nvim", -- Indent guides (config: after/plugin/indent-blankline.lua)
    "MeanderingProgrammer/render-markdown.nvim", -- Markdown rendering (config: after/plugin/render-markdown.lua)

    -----------------------------------------------------------------------
    -- Editing helpers (Lua)
    -----------------------------------------------------------------------
    "nvim-mini/mini.comment", -- Commenting (config: after/plugin/mini-comment.lua)
    {
        "windwp/nvim-autopairs", -- Auto-close pairs (config: after/plugin/autopairs.lua)
    },
    {
        "windwp/nvim-ts-autotag", -- Auto-close/rename HTML tags
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },

    -----------------------------------------------------------------------
    -- Treesitter
    -----------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter", -- Config: after/plugin/treesitter.lua
        branch = "main",
        build = ":TSUpdate",
    },

    -----------------------------------------------------------------------
    -- Fuzzy finder
    -----------------------------------------------------------------------
    "ibhagwan/fzf-lua", -- Config: after/plugin/fzf-lua.lua

    -----------------------------------------------------------------------
    -- Completion + snippets
    -----------------------------------------------------------------------
    {
        "hrsh7th/nvim-cmp", -- Completion engine (config: after/plugin/nvim-cmp.lua)
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
    },
    {
        "L3MON4D3/LuaSnip", -- Snippet engine (config: after/plugin/luasnip.lua)
        version = "v1.*",
        build = "make install_jsregexp",
    },

    -----------------------------------------------------------------------
    -- AI assistants
    -----------------------------------------------------------------------
    {
        "github/copilot.vim", -- GitHub Copilot
        init = function()
            -- Use <C-Space> (mapped in core/keymaps.lua) to accept suggestions.
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_filetypes = {
                json = true,
                yaml = true,
                markdown = true,
                gitcommit = true,
                ["*.env.*"] = false,
                ["*.env"] = false,
            }
            vim.g.copilot_workspace_folders = {
                "~/projects/ncl-api",
                "~/projects/synergy-spa",
            }
        end,
    },
    "nvim-lua/plenary.nvim",
    {
        "olimorris/codecompanion.nvim", -- Config: after/plugin/codecompanion.lua
        version = "v19.*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "ravitemer/codecompanion-history.nvim",
        },
    },
}
