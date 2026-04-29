local ollama_url = os.getenv("OLLAMA_URL")

local anthropic = {
    name = "anthropic",
    model = "claude-sonnet-4-6",
}

local ollama = {
    name = "ollama",
    model = "llama3.1:8b",
}

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
            adapter = anthropic,
        },
        inline = {
            adapter = anthropic,
        },
        cmd = {
            adapter = anthropic,
        },
        -- background = {
        --     adapter = {
        --         name = "ollama",
        --         model = "qwen-7b-instruct",
        --     },
        -- },
    },
})
