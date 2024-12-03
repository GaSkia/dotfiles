return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal left toggle<CR>')
        vim.keymap.set('n', '<leader>T', ':Neotree filesystem reveal float toggle<CR>')
    end
}
