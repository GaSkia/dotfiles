-- TODO: add shortcuts to show lists
return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()

        local api = require("Comment.api")

        vim.keymap.set("n", "<C-k>", api.toggle.linewise.current)

        vim.keymap.set("v", "<C-k>", function()
            return api.call("toggle.linewise")(vim.fn.visualmode())
        end, { expr = true })
    end,
}
