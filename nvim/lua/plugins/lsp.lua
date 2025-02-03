return {
    {
        -- mason
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "pylsp",
                "html",
                "clangd",
                "lua_ls",
                "cssls",
                "jsonls",
                "ts_ls",
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
    },

    -- lsp servers
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
}
