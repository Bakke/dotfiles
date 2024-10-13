local set = vim.keymap.set

-- Relaod config
set('n', '<Leader>r', '<cmd>so $MYVIMRC<CR>', { silent = true })

-- Open .vimrc for editing
set('n', '<Leader>v', '<cmd>edit $MYVIMRC<CR>')

-- Update plugins
set('n', '<Leader>p', '<cmd>PlugUpdate<CR>')

-- Clear last search
set('n', '<Leader>c', '<cmd>nohlsearch<CR>', { silent = true })

-- Copy to clipboard
set('v', '<C-c>', '"+y', { silent = true })

-- Mappings for Git
set('n', '<Leader>gs', '<cmd>Git<CR>', { silent = true })
set('n', '<Leader>gp', '<cmd>Git push<CR>', { silent = true })
set('n', '<Leader>gpf', '<cmd>Git push --force<CR>', { silent = true })
set('n', '<Leader>gl', '<cmd>Git pull<CR>', { silent = true })
set('n', '<Leader>gh', '<cmd>Git log %<CR>', { silent = true })
set('n', '<Leader>gg', '<cmd>Git log --oneline<CR>', { silent = true })
set('n', '<Leader>gb', '<cmd>Git blame<CR>', { silent = true })

-- Fix search (normal regex can be used in searching)
set({ 'n', 'v' }, '/', '/\\v', { silent = true })

-- Search for selected text or text under cursor (normal mode)
set('n', '//', '*')
set('v', '//', 'y/\\V<C-R>"<CR>N')

set('n', '/"', '\\"\zs(\\s)@![^"]+(\\s)@<!\\ze\\"<CR>N')
set('n', "/'", "\\'\\zs(\\s)@![^']+(\\s)@<!\\ze\\'<CR>N")
