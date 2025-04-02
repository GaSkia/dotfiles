return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	opts = {
        event_handlers = {
            {
                event = "file_opened",
                handler = function(arg)
                    local tree = require("neo-tree.command")
                    tree.execute({ action = 'close' })
                end,
            },
        },
    },
	keys = {
		{
			"<leader>t",
			function()
				local tree = require("neo-tree.command")
                tree.execute({
                    position = 'left',
                    toggle = true,
                    dir = vim.uv.cwd()
                })
			end,
        },
        {
            "<leader>T",
            function()
                local tree = require('neo-tree.command')
                tree.execute({
                    position = 'float',
                    toggle = true, dir = vim.uv.cwd()
                })
            end,
			desc = "Explorer NeoTree (cwd)",
		},

	},
}
