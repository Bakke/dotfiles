-- If you are on most recent `nvim-lspconfig`
return {
    cmd = { 'vue-language-server', '--stdio' },
    filetypes = {'typescript', 'javascript', 'vue'},
    root_dir = function(bufnr, on_dir)
        local name = vim.api.nvim_buf_get_name(bufnr)
        -- Skip virtual buffers (`fugitive://` git blobs, `oil://`, `diffview://`, …):
        -- `tsserver` cannot resolve them, so every request we forward comes back empty.
        if name == '' or name:match('^%w[%w+.-]*://') then
            return
        end
        on_dir(vim.fs.root(bufnr, { 'package.json' }))
    end,
    on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
            local param = unpack(result)
            local id, command, payload = unpack(param)

            -- `vue_ls` keeps a pending promise per request id and only clears it when a
            -- response arrives, so every code path below has to answer.
            local function respond(body)
                if body == nil then
                    body = vim.NIL
                end
                ---@diagnostic disable-next-line: param-type-mismatch
                client:notify('tsserver/response', { { id, body } })
            end

            local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
            if #clients == 0 then
                vim.notify('Could not find `vtsls` lsp client, required by `vue_ls`.', vim.log.levels.ERROR)
                respond(nil)
                return
            end
            local ts_client = clients[1]

            ts_client:exec_cmd({
                title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                command = 'typescript.tsserverRequest',
                arguments = {
                    command,
                    payload,
                },
            }, { bufnr = context.bufnr }, function(_, r)
                -- `vtsls` answers with a null result (not an error) for files `tsserver`
                -- does not know about, so `r` is legitimately nil.
                respond(r and r.body)
            end)
        end
    end,
}
