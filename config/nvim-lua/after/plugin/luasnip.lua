if not package.loaded['luasnip'] then
    return
end

require('luasnip.loaders.from_vscode').lazy_load()
