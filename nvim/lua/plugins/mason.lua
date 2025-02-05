return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

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

        keymap.set("n", "<leader>ms", "<cmd>Mason<CR>")
    end,
}
