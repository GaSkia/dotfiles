return {
    {
        "williamboman/mason.nvim",

        config = function()
            local mason = require("mason")

            local keymap = require("vim.keymap")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })


            keymap.set("n", "<leader>ms", "<cmd>Mason<CR>")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = {
                    "ts_ls",
                    "pyright",
                    "clangd",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "lua_ls",
                },
                automatic_installation = true,
            })

        end,

    }
}
