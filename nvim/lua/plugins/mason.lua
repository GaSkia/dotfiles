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

	    -- After setting up mason-lspconfig you may set up servers via lspconfig
	    -- require("lspconfig").lua_ls.setup {}
	    -- require("lspconfig").rust_analyzer.setup {}
	    -- ...
    end,
}
