return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"python",
				"go",
                "css",
                "html",
                "javascript",
                "typescript",
                "cpp",
			},
		})
	end,
}
