return {
    "neovim/nvim-lspconfig",
    opts = {
        -- inlay_hints = { enabled = true },
        servers = {
            pyright = {},
            html = {},
            ts_ls = {},
            cssls = {},
            clangd = {},
            lua_ls = {
                completion = true,
            },
            omnisharp = {},
            rust_analyzer = {
                completion = true,
            },
        },
        -- setup = {},
    },
    config = function (_, opts)
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup{
        }
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
        lspconfig.ts_ls.setup({
            init_options = {
                typescript = {
                    format = {
                        insertSpaceBeforeFunctionParenthesis = true,
                        tabSize = 2,
                    },
                },
                javascript = {
                    format = {
                        insertSpaceBeforeFunctionParenthesis = true,
                        tabSize = 2,
                    },
                },
                project = {
                    tabSize = 2
                }
            }

        })
        lspconfig.clangd.setup{}
        lspconfig.cssls.setup{}
        lspconfig.lua_ls.setup{}
        lspconfig.vue_ls.setup{}
        lspconfig.csharp_ls.setup{
            cmd = {
                -- vim.env.DOTNET_ROOT .. 'dotnet',
                -- 'run',
                '/home/gaskia/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls'

            }
        }
        -- lspconfig.omnisharp.setup{}
        lspconfig.sqls.setup{}
        lspconfig.rust_analyzer.setup{
            on_attach = function(client, bufnr)
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr})
            end,
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
