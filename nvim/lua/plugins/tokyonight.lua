return {
	'folke/tokyonight.nvim',
	lazy = false,
	name = "tokyonight",
	priority = 1000,
	config = function()
        vim.cmd.colorscheme "tokyonight"
    end
   -- { vim.cmd([[colorscheme "tokyonight"]]) },
}
