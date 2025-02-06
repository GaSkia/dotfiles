return {
    "neovim/nvim-lspconfig",
    config = function ()
        local lspconfig = require("lpsconfig")
        lspconfig.pyright.setup{

        }

        lspconfig.ts_ls.setup{}
        lspconfig.clangd.setup{}
        lspconfig.html.setup{}
        lspconfig.cssls.setup{}
        lspconfig.lua_ls.setup{}
        lspconfig.csharp_ls.setup{}
    end
}
-- "ts_ls",
-- "pylsp",
-- "clangd",
-- "html",
-- "cssls",
-- "tailwindcss",
-- "lua_ls",
