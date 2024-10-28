require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "php",
        "python",
        "regex",
        "scss",
        "vue",
        "yaml",
        "typescript",
        "svelte",
        "sql",
        "csv",
    },
}
