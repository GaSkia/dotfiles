return {
    "neovim/nvim-lspconfig",
    -- "neovim/nvim-lspconfig",
    config = function ()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup{

        }

        lspconfig.ts_ls.setup{}
        lspconfig.clangd.setup{}
        lspconfig.html.setup{}
        lspconfig.cssls.setup{}
        lspconfig.lua_ls.setup{}
        -- lspconfig.csharp_ls.setup{
            -- cmd = {
            --     '/home/gaskia/.dotnet/dotnet',
            --     '/home/gaskia/.local/share/nvim/mason/bin/csharp-ls'
            -- }
        -- }
        lspconfig.omnisharp.setup{
            cmd = { "/home/gaskia/.local/share/nvim/mason/bin/omnisharp", "--languageserver" },
            root_dir = require('lspconfig.util').root_pattern('*.sln', '*.csproj', '.git'),
        }
    end,
}
-- "ts_ls",
-- "pylsp",
-- "clangd",
-- "html",
-- "cssls",
-- "tailwindcss",
-- "lua_ls",
