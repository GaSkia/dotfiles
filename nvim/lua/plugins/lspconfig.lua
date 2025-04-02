return {
    "neovim/nvim-lspconfig",
    -- opts = {
        -- inlay_hints = { enabled = true },
        -- servers = {
            -- pyright = {},
            -- html = {},
            -- ts_ls = {},
            -- cssls = {},
            -- clangd = {},
            -- lua_ls = {},
            -- omnisharp = {},
        -- },
        -- setup = {},
    -- },
    config = function ()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup{
--
        }
--
        lspconfig.html.setup({
            cmd = { "vscode-html-language-server", "--stdio" },
            filetypes = { "html", "htmldjango", "eelixir" },
            init_options = {
                configurationSection = { "html", "css", "javascript" },
                embeddedLanguages = {
                    css = true,
                    javascript = true,
                },
            },
            settings = {
                html = {
                    format = {
                        wrapLineLength = 120,
                        unformatted = "wbr",
                    },
                },
            },
        })
        lspconfig.ts_ls.setup{}
        lspconfig.clangd.setup{}
        lspconfig.cssls.setup{}
        lspconfig.lua_ls.setup{}
        lspconfig.csharp_ls.setup{
            cmd = {
                '/home/gaskia/.dotnet/dotnet',
                '/home/gaskia/.local/share/nvim/mason/bin/csharp-ls'
            }
        }
        lspconfig.omnisharp.setup{}
        lspconfig.sqls.setup{}
    end,
}
-- "ts_ls",
-- "pylsp",
-- "clangd",
-- "html",
-- "cssls",
-- "tailwindcss",
-- "lua_ls",
