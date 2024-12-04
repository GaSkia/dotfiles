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

	-- opts = function()
		-- local cmp = require("cmp")
		-- 
		-- return {
			-- mapping = cmp.mapping.preset.insert({
				-- ["C-n"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				-- ["C-p"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				-- ["<C-Space>"] = cmp.mapping.complete(),
				-- }),
				-- ["<C-CR>"] = function(fallback)
					-- cmp.abort()
					-- fallback()
					-- end,
					-- }
					-- end,
					opts = function()
						vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
						local cmp = require("cmp")
						local defaults = require("cmp.config.default")()
						local auto_select = true
						return {
							auto_brackets = {}, -- configure any filetype to auto add brackets
							completion = {
								completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
							},
							preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
							mapping = cmp.mapping.preset.insert({
								["<C-b>"] = cmp.mapping.scroll_docs(-4),
								["<C-f>"] = cmp.mapping.scroll_docs(4),
								["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
								["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
								["<C-Space>"] = cmp.mapping.complete(),
								-- ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
								-- ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
								-- ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
								-- ["<C-CR>"] = function(fallback)
									-- cmp.abort()
									-- fallback()
								-- end,
								["<tab>"] = function(fallback)
									-- return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
								end,
							}),
							sources = cmp.config.sources({
								{ name = "nvim_lsp" },
								{ name = "path" },
							}, {
								{ name = "buffer" },
							}),
							sorting = defaults.sorting,
						}
					end
				}