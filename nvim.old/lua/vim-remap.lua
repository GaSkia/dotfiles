vim.g.mapleader = ';'
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<C-e>', function() vim.diagnostic.float() end)
vim.keymap.set('n', '<leader>ne', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>pe', function() vim.diagnostic.goto_prev() end)
vim.keymap.set('n', '<F4>', ':rightbelow vsplit | term<CR>')
