--TODO: implement nvim-cmp
--TODO: provide snipped.expand function
--NOTE: disable default option
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},

	opts = function()
		local cmp = require("cmp")
		
		return {
			mapping = cmp.mapping.preset.insert({
				["C-n"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["C-p"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			["<C-CR>"] = function(fallback)
				cmp.abort()
				fallback()
			end,
		}
	end,
}
