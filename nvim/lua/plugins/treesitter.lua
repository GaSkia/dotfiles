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
        },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
