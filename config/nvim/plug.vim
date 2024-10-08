if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade'
Plug 'mattn/emmet-vim'
" Plug 'posva/vim-vue'
" Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'wellle/targets.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'coreyja/fzf.devicon.vim'
Plug 'sainnhe/sonokai'
Plug 'vim-scripts/edifact.vim'
Plug 'Fymyte/rasi.vim'

if has("nvim")
	Plug 'windwp/nvim-autopairs'
	Plug 'windwp/nvim-ts-autotag'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'onsails/lspkind.nvim'
	" Plug 'glepnir/lspsaga.nvim'
	" Plug 'folke/lsp-colors.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v4.*' }
    " Plug 'sbdchd/neoformat'
    Plug 'github/copilot.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'}
endif

call plug#end()
