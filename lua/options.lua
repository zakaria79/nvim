-------------
-- Aliases --
-------------
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.opt

-------------
-- Options --
-------------
vim.syntax=true
o.cursorline=true
o.number = true
o.mouse='a'
o.completeopt = 'menuone,noinsert,noselect'
o.inccommand = 'nosplit'
o.signcolumn = 'yes'
o.scrolloff = 5
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop=4
o.expandtab = true
o.shortmess = o.shortmess + 'c'
o.showmode = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.undofile = true
o.colorcolumn='80'
o.mousemodel='popup'
o.swapfile=false
o.wildmenu=true
o.backspace='indent,eol,start'
o.showcmd=true
o.hlsearch=true
o.incsearch=true
o.ignorecase=true
o.smartcase=true
o.autoindent=true
o.smartindent=true
o.diffopt='vertical'
o.bo='all'
o.ttimeout=true
o.ttimeoutlen=100
o.list=true
-- o.listchars='tab:>-,trail:-'
o.listchars='tab:..,trail:.'
-- o.listchars='tab:..,trail:.'
o.startofline=false
o.ruler=true
o.laststatus=2
o.confirm=true
o.eb=false
o.vb=false
o.autoread=true
o.shiftround=true
o.showmatch=true
o.path=o.path + '**'
o.hidden=true
o.backup=false
o.writebackup=false
o.cmdheight=1
o.updatetime=100
o.omnifunc ='syntaxcomplete#Complete'
o.wrap=false
g.mapleader=" "
g.fzf_buffers_jump = 1

g.nvim_tree_highlight_opened_files = 1

g.user_emmet_leader='<Tab>'
g.user_emmet_settings = {
    javascript = {
        extends = "jsx"
    }
}
g.foldmethod='expr'
g.foldexpr="nvim_treesitter#foldexpr()"

g.netrw_liststyle=3

g.netrw_winsize=30
