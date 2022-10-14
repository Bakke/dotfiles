if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
" Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
" Plug 'wellle/targets.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/sonokai'

if has("nvim")
	Plug 'windwp/nvim-autopairs'
	Plug 'windwp/nvim-ts-autotag'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim'
	Plug 'folke/lsp-colors.nvim'
	Plug 'hrsh7th/nvim-compe'
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
	" Plug 'nvim-telescope/telescope.nvim'
endif

call plug#end()
