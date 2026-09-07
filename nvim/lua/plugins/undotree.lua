return {
    'mbbill/undotree',
    lazy = false,
    config = function()
            vim.cmd [[
            let g:undotree_WindowLayout = 4
        ]]
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {})
    end,
}
