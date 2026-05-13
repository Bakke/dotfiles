local ollama_url = os.getenv("OLLAMA_URL")

local claude_opus = {
    name = "anthropic",
    model = "claude-opus-4-7",
}

local claude_sonnet = {
    name = "anthropic",
    model = "claude-sonnet-4-6",
}

local ollama = {
    name = "ollama",
    model = "llama3.1:8b",
}

local default_adapter = claude_sonnet

require("codecompanion").setup({
    adapters = {
        http = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    env = {
                        url = ollama_url,
                    },
                })
            end,
        }
    },
    interactions = {
        chat = {
            adapter = default_adapter,
        },
        inline = {
            adapter = default_adapter,
        },
        cmd = {
            adapter = default_adapter,
        },
        -- background = {
        --     adapter = {
        --         name = "ollama",
        --         model = "qwen-7b-instruct",
        --     },
        -- },
    },
})

vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion" })
