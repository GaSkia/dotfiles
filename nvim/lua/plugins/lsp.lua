return {
    {
        -- mason lspconfig
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        cmd = "Mason",
        keys = {
            { "<leader>ms", "<cmd>Mason<CR>", desc = "Mason"},
        },
        build = ":MasonUpdate",
        opts_extend = { "ensure_installed" },
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
        config = function(_, opts)
            require("mason").setup({
                pip = {
                    upgrade_pip = true,
                    install_args = {},
                }
            })
            
            require("mason-lspconfig").setup({
            }) 

            -- After setting up mason-lspconfig you may set up servers via lspconfig
            -- require("lspconfig").lua_ls.setup {}
            -- require("lspconfig").rust_analyzer.setup {}
        end,
    },

    -- lsp servers
    {
        "neovim/nvim-lspconfig",
        event = "LazyFile",
        dependencies = {
            "mason.nvim",
            { "williamboman/mason-lspconfig.nvim", config = function() end },
        },
        cmd = "lsp",
        opts = function()
            
        end,
    },
}
