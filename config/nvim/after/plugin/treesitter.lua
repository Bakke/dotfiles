local treesitter = require('nvim-treesitter')
local treesitter_languages = {
  'bash',
  'css',
  'dockerfile',
  'go',
  'html',
  'javascript',
  'json',
  'lua',
  'php',
  'python',
  'regex',
  'scss',
  'vue',
  'yaml',
  'typescript',
  'svelte',
  'sql',
  'csv',
}

treesitter.install(treesitter_languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_languages,
  callback = function()
      vim.treesitter.start()

      vim.cmd('filetype indent off')
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.bo.autoindent = false
      vim.bo.cindent = false
      vim.bo.smartindent = false
  end,
})
