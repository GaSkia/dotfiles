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

--	opts = function()
--		local cmp = require("cmp")
--
--        cmp.config.disable = true
--		return {
--			mapping = cmp.mapping.preset.insert({
--				["C-n"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--				["C-p"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--				["<C-Space>"] = cmp.mapping.complete(),
--			}),
--			["<C-CR>"] = function(fallback)
--				cmp.abort()
--				fallback()
--			end,
--		}
--	end,
    config = function()
        local cmp = require'cmp'

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select }),
                ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select }),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),

            -- formatting = {
            --     format = function()
            --         vim_item.dup = ({
            --             vsnip = 0,
            --             nvim_lsp = 0,
            --             nvim_lua = 0,
            --             buffer = 0,
            --         })[entry.source.name] or 0
            --     end,
            -- },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            }),
        })

    end,
}
