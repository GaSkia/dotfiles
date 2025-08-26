vim.g.mapleader = ';'

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.diagnostic.config({
   virtual_text = false,
   always = true,
   float = {
       border = "rounded",
       source = "always",
   },
})
vim.keymap.set('n', '<leader>ne', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>pe', function() vim.diagnostic.goto_prev() end)
vim.keymap.set('n', '<leader>1', '<cmd>tabn 1<CR>')
vim.keymap.set('n', '<leader>2', '<cmd>tabn 2<CR>')
vim.keymap.set('n', '<leader>3', '<cmd>tabn 3<CR>')
vim.keymap.set('n', '<leader>4', '<cmd>tabn 4<CR>')
vim.keymap.set('n', '<leader>5', '<cmd>tabn 5<CR>')
vim.keymap.set('n', '<leader>6', '<cmd>tabn 6<CR>')
vim.keymap.set('n', '<leader>7', '<cmd>tabn 7<CR>')
vim.keymap.set('n', '<leader>8', '<cmd>tabn 8<CR>')
vim.keymap.set('n', '<leader>9', '<cmd>tabn 9<CR>')
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>cf', function () vim.lsp.buf.format({ async = false }) end)
-- vim.opt.mouse = ""

vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('FileType',
{
    pattern = 'python',
    callback = function()
        vim.opt.colorcolumn = '80'
    end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.uxml",
    command = "set filetype=xml"
})
