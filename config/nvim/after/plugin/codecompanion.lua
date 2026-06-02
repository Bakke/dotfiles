local claude_code = {
    name = "claude_code",
}

local ollama = {
    name = "ollama",
    model = "llama3.1:8b",
}

local default_adapter = claude_code

require("codecompanion").setup({
    adapters = {
        http = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    env = {
                        url = vim.env.OLLAMA_URL,
                    },
                })
            end,
        },
        acp = {
            claude_code = function()
                return require("codecompanion.adapters").extend("claude_code", {
                    env = {
                        CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_OAUTH_TOKEN,
                    },
                })
            end,
        },
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
        cli = {
            agent = "claude_code",
            agents = {
                claude_code = {
                    cmd = "claude",
                    args = {},
                    description = "Claude Code CLI",
                    provider = "terminal",
                },
            },
            opts = {
                auto_insert = true, -- Enter insert mode when focusing the CLI terminal
                reload = true, -- Reload buffers when an agent modifies files on disk
            },
        },
        -- background = {
        --     adapter = {
        --         name = "ollama",
        --         model = "qwen-7b-instruct",
        --     },
        -- },
    },
    prompt_library = {
        ['Branch code review'] = {
            strategy = 'chat',
            description = 'Perform a code review on the current branch',
            opts = {
                is_slash_command = true, -- Accessible via /review-branch in chat
                short_name = "review-branch",
            },
            prompts = {
                {
                    role = 'user',
                    content = function()
                        local target = vim.fn.input('Target branch (default: master): ', 'master')
                        -- Use git to get the diff between the current branch and the target
                        return "Review these changes: " .. vim.fn.system('git diff ' .. target .. '..HEAD')
                    end,
                },
            },
        }
    },
    extensions = {
        history = {
            enabled = true,
            opts = {
                -- Keymap to open history from chat buffer (default: gh)
                keymap = "gh",
                -- Keymap to save the current chat manually (when auto_save is disabled)
                save_chat_keymap = "sc",
                -- Save all chats by default (disable to save only manually using 'sc')
                auto_save = true,
                -- Number of days after which chats are automatically deleted (0 to disable)
                expiration_days = 0,
                -- Picker interface (auto resolved to a valid picker)
                picker = "fzf-lua", --- ("telescope", "snacks", "fzf-lua", or "default") 
                ---Optional filter function to control which chats are shown when browsing
                chat_filter = nil, -- function(chat_data) return boolean end
                -- Customize picker keymaps (optional)
                picker_keymaps = {
                    rename = { n = "r", i = "<M-r>" },
                    delete = { n = "d", i = "<M-d>" },
                    duplicate = { n = "<C-y>", i = "<C-y>" },
                },
                ---Automatically generate titles for new chats
                auto_generate_title = true,
                title_generation_opts = {
                    ---Adapter for generating titles (defaults to current chat adapter) 
                    adapter = "copilot", -- "copilot"
                    ---Model for generating titles (defaults to current chat model)
                    model = "gpt-4o", -- "gpt-4o"
                    ---Number of user prompts after which to refresh the title (0 to disable)
                    refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
                    ---Maximum number of times to refresh the title (default: 3)
                    max_refreshes = 3,
                    format_title = function(original_title)
                        -- this can be a custom function that applies some custom
                        -- formatting to the title.
                        return original_title
                    end
                },
                ---On exiting and entering neovim, loads the last chat on opening chat
                continue_last_chat = false,
                ---When chat is cleared with `gx` delete the chat from history
                delete_on_clearing_chat = false,
                ---Directory path to save the chats
                dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
                ---Enable detailed logging for history extension
                enable_logging = false,

                -- Summary system
                summary = {
                    -- Keymap to generate summary for current chat (default: "gcs")
                    create_summary_keymap = "gcs",
                    -- Keymap to browse summaries (default: "gbs")
                    browse_summaries_keymap = "gbs",
                    
                    generation_opts = {
                        -- defaults to current chat adapter
                        adapter = "copilot", -- "copilot"
                        -- defaults to current chat model
                        model = "gpt-4o", -- "gpt-4o"
                        context_size = 90000, -- max tokens that the model supports
                        include_references = true, -- include slash command content
                        include_tool_outputs = true, -- include tool execution results
                        system_prompt = nil, -- custom system prompt (string or function)
                        format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
                    },
                },
                
                -- Memory system (requires VectorCode CLI)
                memory = {
                    -- Automatically index summaries when they are generated
                    auto_create_memories_on_summary_generation = true,
                    -- Path to the VectorCode executable
                    vectorcode_exe = "vectorcode",
                    -- Tool configuration
                    tool_opts = { 
                        -- Default number of memories to retrieve
                        default_num = 10 
                    },
                    -- Enable notifications for indexing progress
                    notify = true,
                    -- Index all existing memories on startup
                    -- (requires VectorCode 0.6.12+ for efficient incremental indexing)
                    index_on_startup = false,
                },
            }
        }
    }
})

vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle CodeCompanion" })
