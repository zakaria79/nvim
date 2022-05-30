-- vim.opt.shiftwidth=2 
-- vim.opt.tabstop=2
vim.cmd [[setlocal shiftwidth=2]]
vim.cmd [[setlocal tabstop=2]]
vim.cmd 'autocmd BufWrite *.ts :Prettier<CR>'
