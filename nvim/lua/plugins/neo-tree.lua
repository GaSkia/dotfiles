return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	opts = {},
	keys = {
		{
			"<leader>t",
			function()
				tree = require("neo-tree.command")
                tree.execute({toggle = false, dir = vim.uv.cwd() })
			end,
            "<leader>T",
            function()
                tree = require('neo-tree.command')
                tree.execute({dir = vim.uv.cwd(), position='float'})
            end,
			desc = "Explorer NeoTree (cwd)",
		},

	},
	config = function(_, opts)
		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			event = events.FILE_OPENED
		})
	end,
}
