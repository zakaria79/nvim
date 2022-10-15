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
    -- use 'glepnir/lspsaga.nvim'
    use 'ray-x/lsp_signature.nvim'


    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        -- config = function()
            -- local saga = require("lspsaga")

            -- saga.init_lsp_saga({


            --     border_style = "single",
            --     -- when cursor in saga window you config these to move
            --     move_in_saga = { prev = '<C-p>',next = '<C-n>'},
            --     -- Error, Warn, Info, Hint
            --     -- use emoji like
            --     -- { "🙀", "😿", "😾", "😺" }
            --     -- or
            --     diagnostic_header = { "😡", "😥", "😤", "😐" },
            --     -- { "😡", "😥", "😤", "😐" }
            --     -- and diagnostic_header can be a function type
            --     -- must return a string and when diagnostic_header
            --     -- is function type it will have a param `entry`
            --     -- entry is a table type has these filed
            --     -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
            --     -- diagnostic_header = { " ", " ", " ", "ﴞ " },
            --     -- show diagnostic source
            --     show_diagnostic_source = true,
            --     -- add bracket or something with diagnostic source, just have 2 elements
            --     diagnostic_source_bracket = {},
            --     -- use emoji lightbulb in default
            --     code_action_icon = "💡",
            --     -- if true can press number to execute the codeaction in codeaction window
            --     code_action_num_shortcut = true,
            --     -- same as nvim-lightbulb but async
            --     code_action_lightbulb = {
            --         enable = true,
            --         sign = true,
            --         sign_priority = 20,
            --         virtual_text = true,
            --     },
            --     -- finder icons
            --     finder_icons = {
            --     def = '  ',
            --     ref = '諭 ',
            --     link = '  ',
            --     },
            --     -- preview lines of lsp_finder and definition preview
            --     max_preview_lines = 10,
            --     finder_action_keys = {
            --         open = "o",
            --         vsplit = "s",
            --         split = "i",
            --         tabe = "t",
            --         quit = "q",
            --         scroll_down = "<C-f>",
            --         scroll_up = "<C-b>", -- quit can be a table
            --     },
            --     code_action_keys = {
            --         quit = "q",
            --         exec = "<CR>",
            --     },
            --     rename_action_quit = "<C-c>",
            --     definition_preview_icon = "  ",
            --     -- show symbols in winbar must nightly
            --     symbol_in_winbar = {
            --         in_custom = false,
            --         enable = false,
            --         separator = ' ',
            --         show_file = true,
            --         click_support = false,
            --     },

            --     -- if you don't use nvim-lspconfig you must pass your server name and
            --     -- the related filetypes into this table
            --     -- like server_filetype_map = { metals = { "sbt", "scala" } }
            --     server_filetype_map = {},


            --     -- your configuration
            -- })
        -- end,
    })


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


