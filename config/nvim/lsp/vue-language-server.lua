-- If you are on most recent `nvim-lspconfig`
return {
    cmd = { 'vue-language-server', '--stdio' },
    filetypes = {'typescript', 'javascript', 'vue'},
    root_markers = { 'package.json' },
    on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
            local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
            if #clients == 0 then
                vim.notify('Could not find `vtsls` lsp client, required by `vue_ls`.', vim.log.levels.ERROR)
                return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
                title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                command = 'typescript.tsserverRequest',
                arguments = {
                    command,
                    payload,
                },
            }, { bufnr = context.bufnr }, function(_, r)
                local response_data = { { id, r.body } }
                ---@diagnostic disable-next-line: param-type-mismatch
                client:notify('tsserver/response', response_data)
            end)
        end
    end,
}
