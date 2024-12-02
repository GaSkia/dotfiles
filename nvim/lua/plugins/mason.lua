return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
	    "williamboman/mason.nvim",
	    "neovim/nvim-lspconfig",
    },
    config = function()
	    require("mason").setup()
	    require("mason-lspconfig").setup({
	    ensure_installed = {omnisharp, pylsp}
	    }) 

	    -- After setting up mason-lspconfig you may set up servers via lspconfig
	    -- require("lspconfig").lua_ls.setup {}
	    -- require("lspconfig").rust_analyzer.setup {}
	    -- ...
    end,
}
