-- Editor options (migrated from the old Vim settings.vim)

local opt = vim.opt

-- Searching
opt.hlsearch = true       -- Highlight matches of the last search
opt.incsearch = true      -- Show matches incrementally while typing
opt.ignorecase = true     -- Ignore case when searching...
opt.smartcase = true      -- ...unless the pattern contains an uppercase letter

-- UI / editing
opt.laststatus = 2        -- Always show the statusline
opt.relativenumber = true -- Relative line numbers (current line shown as 0)
opt.title = true          -- Set the window title to the filename
opt.showtabline = 2       -- Always show the tab/buffer line
opt.ruler = true          -- Show the cursor position
opt.showcmd = true        -- Display incomplete commands
opt.backspace = { "indent", "eol", "start" } -- Backspace over everything in insert mode
opt.visualbell = true     -- Use a visual bell instead of beeping
opt.wrap = true           -- Wrap long lines
opt.linebreak = true      -- Wrap at word boundaries, not mid-word
opt.showmode = false      -- Don't show the mode (lualine handles it)
opt.hidden = true         -- Allow hidden (unsaved) buffers
opt.autoread = true       -- Reload files changed outside Neovim
opt.scrolloff = 3         -- Keep 3 lines visible above/below the cursor
opt.foldmethod = "indent" -- Fold based on indentation
opt.foldenable = false    -- Start with all folds open
opt.nrformats = { "alpha", "octal", "bin", "hex" } -- <C-a>/<C-x> recognise 0x/0o/0b and letters
opt.conceallevel = 2      -- Conceal markup (e.g. in markdown)
opt.winborder = "rounded" -- Rounded borders for floating windows

-- Indentation
opt.smartindent = true    -- Smart autoindenting for C-like code
opt.expandtab = true      -- Expand tabs to spaces
opt.smarttab = true       -- <Tab>/<BS> use shiftwidth at the start of a line
opt.shiftwidth = 4        -- Spaces per indentation level
opt.softtabstop = 4       -- <Tab> inserts 4 spaces

-- Splits
opt.splitbelow = true     -- Horizontal splits open below
opt.splitright = true     -- Vertical splits open to the right

-- Format options
opt.formatoptions = "croqn2l1j"
--  c - format comments
--  r - continue comments on <Enter>
--  o - continue comments with o/O
--  q - allow formatting comments with gq
--  n - recognise numbered lists
--  2 - use the indent of the second paragraph line
--  l - don't break lines that were already long
--  1 - break before, not after, one-letter words
--  j - remove the comment leader when joining lines

-- Disable the mouse
opt.mouse = ""

-- No swap/backup files; persist undo history instead
opt.swapfile = false
opt.writebackup = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undo-dir")

-- Keep the signcolumn in the number column so text doesn't shift
opt.signcolumn = "number"
