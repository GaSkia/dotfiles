-- TODO: add shortcuts to show lists
return {
    'numToStr/Comment.nvim',
    config = function()
	    local api = require("Comment.api")
	    local config = require("Comment.config"):get()
	    vim.keymap.set('n', '<C-k>', api.toggle.linewise.current)
        vim.keymap.set('v', '<C-k>', api.call('toggle.linewise', 'g@'),
            { expr = true}
        )

    end,
}
