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
