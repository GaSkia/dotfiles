return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()

        local api = require("Comment.api")

        vim.keymap.set("n", "<C-k>", api.toggle.linewise.current)

        vim.keymap.set('v', '<C-k>', api.call('toggle.linewise', 'g@'),
            { expr = true}
        )
    end,
}
