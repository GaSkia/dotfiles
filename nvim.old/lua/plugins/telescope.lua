return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<C-g>', builtin.git_files)
        vim.keymap.set('n', '<leader>fw', builtin.grep_string)
    end,
}
