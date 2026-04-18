return{
	"nvim-treesitter/nvim-treesitter",
    lazy = false,
	build = ":TSUpdate",
    config = function(_, opts)
        local ts = require('nvim-treesitter')
        ts.install  {
            "c",
            "python",
            "rust",
            "ron",
            "javascript",
            "c_sharp",
            'xml',
            'css',
            'gdscript'
        }
        -- ts.highlight = { enable = true },
        -- incremental_selection = { enable = true },
        -- indent = { enable = true },
    end,
}
