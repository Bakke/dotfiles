local opt = vim.opt

-- Searching
opt.hlsearch = true         -- Syntax highlighting on last search
opt.incsearch = true        -- Instant (char by char) search
opt.ignorecase = true       -- Ignore case when searching
opt.smartcase = true        -- Ignore case if search pattern is all lowercase, case-sensitive otherwise

-- Editing options
opt.laststatus = 2          -- Always show statusline
opt.relativenumber = true   -- Use relative line numbers. Current line is still in status bar.
opt.title = true            -- Show the filename in the window titlebar
opt.showtabline = 2         -- Always show tab bar
opt.ruler = true            -- Show the cursor position all the time
opt.showcmd = true          -- Display incomplete commands
opt.visualbell = true       -- Use visual bell instead of audible bell (annnnnoying)
opt.wrap = true             -- Wrap long lines
opt.linebreak = true        -- Do not break lines inside words
opt.showmode = false        -- Don't show the current mode (airline.vim takes care of us)
opt.magic = true            -- Enable extended regexes
opt.hidden = true           -- Enable hidden buffers
opt.autoread = true         -- Auto reload files that are changed outside vim
opt.scrolloff = 3           -- Start scrolling three lines before horizontal border of window
opt.ttyfast = true          -- Sends more characters at a time
opt.foldmethod = 'indent'
opt.foldenable = false

-- Indention
opt.shiftwidth = 4          -- Number of spaces for indenting
opt.softtabstop = 4         -- Pressing tab key results in 4 spaces

-- Split options
opt.splitbelow = true       -- Split below instead of above
opt.splitright = true       -- Split right instead of left

-- Format options
local formatoptions = {
    'c',                    -- Format comments
    'r',                    -- Continue comments by default
    'o',                    -- Make comment when using o or O from comment line
    'j',                    -- Delete comment character when joining commented lines
    'q',                    -- Format comments with gq
    'n',                    -- Recognize numbered lists
    '2',                    -- Use indent from 2nd line of a paragraph
    'l',                    -- Don't break lines that are already long
    '1'                     -- Break before 1-letter words
}

opt.formatoptions = table.concat(formatoptions, '')

-- Disable mouse
opt.mouse = ''

opt.swapfile = false
opt.writebackup = false
opt.backup = false

-- Persist the undo tree for each file
opt.undofile = true

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
opt.signcolumn = 'number'
