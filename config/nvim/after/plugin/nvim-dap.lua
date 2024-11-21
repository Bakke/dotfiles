-- just want to make sure that we have dap and dapui
local has_dap, dap = pcall(require, "dap")
if not has_dap then
    return
end

local has_dap_ui, dapui = pcall(require, "dapui")
if not has_dap_ui then
    return
end

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    -- change this to where you build vscode-php-debug
    args = { os.getenv("HOME") .. "/.local/share/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
    -- to listen to php call in docker container
    {
        name = "listen for Xdebug docker",
        type = "php",
        request = "launch",
        port = 9003,
        -- this is where your file is in the container
        pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}"
        }
    },
    -- to run php right from the editor
    -- {
    --     name = "run current script",
    --     type = "php",
    --     request = "launch",
    --     port = 9003,
    --     cwd = "${fileDirname}",
    --     program = "${file}",
    --     runtimeExecutable = "php"
    -- },
    -- to listen to any php call
    -- {
    --     name = "listen for Xdebug local",
    --     type = "php",
    --     request = "launch",
    --     port = 9003,
    -- },
}

-- toggle the UI elements after certain events
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dapui.setup()

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<F1>", require "dap".continue, {})
map("n", "<F2>", require "dap".step_over, {})
map("n", "<F3>", require "dap".step_into, {})
map("n", "<F4>", require "dap".step_out, {})
map("n", "<leader>b", require "dap".toggle_breakpoint, {})
map("n", "<leader>du", ":lua require'dapui'.toggle()<cr>", {})
