return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },

    config = function()
        require("flutter-tools").setup {
            lsp = {
                -- this keeps the plugin in control of LSP setup
                settings = {
                    dart = {
                        lineLength = 80, -- optional
                    },
                },
            },
            -- 👇 formatter settings
            widget_guides = {
                enabled = true,
            },
        }

        -- 👇 Set tab size behavior for Dart specifically
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dart",
            callback = function()
                vim.bo.shiftwidth = 2
                vim.bo.tabstop = 2
                vim.bo.softtabstop = 2
                vim.bo.expandtab = true
            end,
        })
    end,
}
