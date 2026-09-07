return{
	"nvim-treesitter/nvim-treesitter",
    lazy = false,
	build = ":TSUpdate",
    opts = {
        indent = { enable = true },
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
            'typescript',
            'typescriptreact',
        },

    }
}
