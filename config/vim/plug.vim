call plug#begin()

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jremmen/vim-ripgrep'
Plug 'sainnhe/sonokai'
Plug 'vim-scripts/edifact.vim'
Plug 'Fymyte/rasi.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

if has("nvim")
    Plug 'ibhagwan/fzf-lua'
    Plug 'numToStr/Comment.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'williamboman/mason.nvim'
    Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
    Plug 'onsails/lspkind.nvim'
    Plug 'fei6409/log-highlight.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'mikavilpas/yazi.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.*' }
    Plug 'github/copilot.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}

    " Plug 'mfussenegger/nvim-dap'
    " Plug 'nvim-neotest/nvim-nio'
    " Plug 'rcarriga/nvim-dap-ui'
    " Plug 'theHamsta/nvim-dap-virtual-text'
else
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'coreyja/fzf.devicon.vim'
endif

call plug#end()
