local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

return {
    cmd = { 'vtsls', '--stdio' },
    root_dir = function(bufnr, on_dir)
        local name = vim.api.nvim_buf_get_name(bufnr)
        -- Skip virtual buffers (`fugitive://` git blobs, `oil://`, `diffview://`, …):
        -- `tsserver` cannot resolve them.
        if name == '' or name:match('^%w[%w+.-]*://') then
            return
        end
        on_dir(vim.fs.root(bufnr, { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' }))
    end,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
}
