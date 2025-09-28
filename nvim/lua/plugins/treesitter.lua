return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c",
            "python",
            "rust",
            "ron",
            "javascript",
            "c_sharp",
            'xml',
            'css'
        },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
