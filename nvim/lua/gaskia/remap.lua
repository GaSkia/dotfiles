vim.g.mapleader = ';'
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal left<CR>')
vim.keymap.set('n', '<leader>T', ':Neotree filesystem reveal float<CR>')
vim.keymap.set('n', '<C-e>', function() vim.diagnostic.float() end)
vim.keymap.set('n', '<leader>ne', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>pe', function() vim.diagnostic.goto_prev() end)
