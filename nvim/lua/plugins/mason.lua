return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
	    "williamboman/mason.nvim",
	    "neovim/nvim-lspconfig",
    },
    opts = {
	    ensure_installed = {
		    "csharpier",
		    "pylsp",
		    "netcoredbg",
	    }
    },
    config = function()
	    require("mason").setup()
	    require("mason-lspconfig").setup({
	    }) 
    end,
}
