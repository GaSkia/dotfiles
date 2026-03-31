return{
	"nvim-treesitter/nvim-treesitter",
    branch = 'master',
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
            'css',
            'gdscript',
        },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
