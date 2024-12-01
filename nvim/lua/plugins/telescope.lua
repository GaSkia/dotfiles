return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
	},
	config = function ()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files)
		vim.keymap.set('n', '<leader>lv', builtin.live_grep)
		vim.keymap.set('n', '<leader>buffers', builtin.buffers)
		vim.keymap.set('n', '<leader>help_tags', builtin.help_tags)
	end,
}
