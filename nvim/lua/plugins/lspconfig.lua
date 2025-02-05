return {
    "neovim/nvim-lspconfig",
    config = function ()
        local lspconfig = require("lpsconfig")
        lspconfig.pyright.setup{
        }
    end
}
-- "ts_ls",
-- "pylsp",
-- "clangd",
-- "html",
-- "cssls",
-- "tailwindcss",
-- "lua_ls",
