require("core.options")
require("core.lsp")

vim.filetype.add({
    extension = {
        env = "sh", -- Set .env files to use shell syntax
    },
    filename = {
        [".env"] = "sh",
        ["env"] = "sh",
    },
    pattern = {
        ["%.env%.[%w%.]+"] = "sh", -- Matches .env.local, .env.development, etc.
    },
})
