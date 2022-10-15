-------------
-- Aliases --
-------------
local cmd = vim.cmd

require 'options'

require'plugins'

cmd 'colorscheme dracula'

cmd 'autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE'
-- cmd 'autocmd BufWrite *.ts lua vim.lsp.buf.formatting_sync(nul, 1000)'

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
    {"🭽", "FloatBorder"},
    {"▔", "FloatBorder"},
    {"🭾", "FloatBorder"},
    {"▕", "FloatBorder"},
    {"🭿", "FloatBorder"},
    {"▁", "FloatBorder"},
    {"🭼", "FloatBorder"},
    {"▏", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

require "lsp_signature".setup()


require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            -- '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    }
}

local saga = require 'lspsaga'
saga.init_lsp_saga {


                border_style = "single",
                -- when cursor in saga window you config these to move
                move_in_saga = { prev = '<C-p>',next = '<C-n>'},
                -- Error, Warn, Info, Hint
                -- use emoji like
                -- { "🙀", "😿", "😾", "😺" }
                -- or
                diagnostic_header = { "😡", "😥", "😤", "😐" },
                -- { "😡", "😥", "😤", "😐" }
                -- and diagnostic_header can be a function type
                -- must return a string and when diagnostic_header
                -- is function type it will have a param `entry`
                -- entry is a table type has these filed
                -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
                -- diagnostic_header = { " ", " ", " ", "ﴞ " },
                -- show diagnostic source
                -- show_diagnostic_source = true,
                -- add bracket or something with diagnostic source, just have 2 elements
                -- diagnostic_source_bracket = {},
                -- use emoji lightbulb in default
                code_action_icon = "💡",
                -- if true can press number to execute the codeaction in codeaction window
                code_action_num_shortcut = true,
                -- same as nvim-lightbulb but async
                code_action_lightbulb = {
                    enable = true,
                    sign = true,
                    sign_priority = 20,
                    virtual_text = true,
                },
                -- finder icons
                finder_icons = {
                def = '  ',
                ref = '諭 ',
                link = '  ',
                },
                -- preview lines of lsp_finder and definition preview
                max_preview_lines = 10,
                finder_action_keys = {
                    open = "o",
                    vsplit = "s",
                    split = "i",
                    tabe = "t",
                    quit = "q",
                    scroll_down = "<C-f>",
                    scroll_up = "<C-b>", -- quit can be a table
                },
                code_action_keys = {
                    quit = "q",
                    exec = "<CR>",
                },
                rename_action_quit = "<C-c>",
                -- definition_preview_icon = "  ",
                -- show symbols in winbar must nightly
                symbol_in_winbar = {
                    in_custom = false,
                    enable = false,
                    separator = ' ',
                    show_file = true,
                    click_support = false,
                },

                -- if you don't use nvim-lspconfig you must pass your server name and
                -- the related filetypes into this table
                -- like server_filetype_map = { metals = { "sbt", "scala" } }
                server_filetype_map = {},


                -- your configuration

}




-- local saga = require 'lspsaga'
-- saga.init_lsp_saga {
-- 
-- }

-- local saga = require 'lspsaga'
-- saga.init_lsp_saga {
--     debug = false,
--     use_saga_diagnostic_sign = true,
--     error_sign = "",
--     warn_sign = "",
--     hint_sign = "",
--     infor_sign = "",
--     -- code action title icon
--     code_action_icon = " ",
--     code_action_prompt = {
--         enable = false,
--         sign = true,
--         sign_priority = 40,
--         virtual_text = true,
--     },
--     finder_definition_icon = "  ",
--     finder_reference_icon = "  ",
--     max_preview_lines = 20,
--     finder_action_keys = {
--         open = "o",
--         vsplit = "s",
--         split = "i",
--         quit = "q",
--         scroll_down = "<C-f>",
--         scroll_up = "<C-b>",
--     },
--     code_action_keys = {
--         quit = "q",
--         exec = "<CR>",
--     },
--     rename_action_keys = {
--         quit = "<C-c>",
--         exec = "<CR>",
--     },
--     definition_preview_icon = "  ",
--     border_style = "single",
--     rename_prompt_prefix = "➤",
--     server_filetype_map = {},
-- }


-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts_, ...)
    local opts_ = opts_ or {}
    opts_.border = opts_.border or border
    return orig_util_open_floating_preview(contents, syntax, opts_, ...)
end

local map_opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
end

require('Comment').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require('lspconfig')

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

lspconfig.intelephense.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require'lspconfig'.util.root_pattern("composer.json", ".git");
}

lspconfig.tsserver.setup{
    handlers = handlers,
    compilerOptions = {
        -- module = "commonjs",
        module = "ES6",
        target = "es6",
        checkJs = false
    };
    exclude = { "node_modules" };
    cmd = { "typescript-language-server", "--stdio" };
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" };
    init_options = {
        hostInfo = "neovim"
    };
    root_dir = require'lspconfig'.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    };
    codeActionsOnSave = {
        source = {addMissingImports = {ts = true}}
    }
}
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local sumneko_root_path = '/home/zakaria/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    current_line_blame_opts = { delay = 1000, virt_text = 'eol' },
    diff_opts = {internal=true},
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts_)
            opts_ = opts_ or {}
            opts_.buffer = bufnr
            vim.keymap.set(mode, l, r, opts_)
        end
        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})
        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})
        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)
        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}



-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
require('nvim-autopairs').setup{}


lspconfig.jsonls.setup {
    capabilities=capabilities,
    settings = {
        json = {
            schemas = {
                {
                    description = 'JavaScript Package Manager File',
                    fileMatch = {'package.json'},
                    url = 'https://json.schemastore.org/package.json'
                },
                {
                    description = 'TypeScript compiler configuration file',
                    fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
                    url = 'http://json.schemastore.org/tsconfig'
                },
                {
                    description = 'Prettier config',
                    fileMatch = {'.prettierrc', '.prettierrc.json', 'prettier.config.json'},
                    url = 'http://json.schemastore.org/prettierrc'
                },
            }
        }
    }
}

