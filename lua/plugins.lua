-------------
-- Aliases --
-------------
local cmd = vim.cmd
-- local fn = vim.fn
-- local g = vim.g
-- local map = vim.api.nvim_set_keymap
-- local o = vim.opt

cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'ray-x/lsp_signature.nvim'
    -- autocompletion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use '/windwp/nvim-autopairs'
    -- git
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'prettier/vim-prettier'
    use 'nvim-treesitter/nvim-treesitter'
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'jremmen/vim-ripgrep'
    use 'kyazdani42/nvim-web-devicons'
    -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    -- Add indentation guides even on blank lines
    -- use 'lukas-reineke/indent-blankline.nvim'
    use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
    use 'morhetz/gruvbox'
    use 'dracula/vim'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use '/jose-elias-alvarez/null-ls.nvim'
end)


