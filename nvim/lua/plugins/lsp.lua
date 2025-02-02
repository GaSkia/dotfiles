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
                ""
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
        opts = {
            servers = {
                omnisharp = {
                    handlers = {
                        ["textDocument/definition"] = function(...)
                            return require("omnisharp_extended").handler(...)
                        end,
                    },
                },
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require'cmp_nvim_lsp'.default_capabilities()
            local on_attach = function()
                vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {})
            end

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
            })

            lspconfig.lua_ls.setup({
                settings = {
                    diagnostic = {
                        globals = { "vim" },
                        capabilities = capabilities,
                    }
                }
            })

            lspconfig.omnisharp.setup({
                cmd = { "/home/gaskia/.local/share/nvim/mason/bin/omnisharp","dotnet", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln", ".git"),
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    globals = { "vim" },
                    capabilities = capabilities,
                }
            })
            lspconfig.html.setup({
                settings = {
                    diagnostic = {
                        globals = { "vim" },
                        capabilities = capabilities,
                    }
                }
            })

            lspconfig.cssls.setup({
                settings = {
                    diagnostic = {
                        globals = { "vim" },
                        capabilities = capabilities,
                    },
                },
            })
        end,
    }
}
