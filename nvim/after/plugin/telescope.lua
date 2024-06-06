require("telescope.health").check()
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<C-g>', builtin.git_files)
