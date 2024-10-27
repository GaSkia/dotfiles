require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})

local on_attach = function()
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}

require("lspconfig").pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").clangd.setup {
    on_attach = on_attach(),
    capabilities = capabilities,
}

-- require("lspconfig").dcm.setup {
--     on_attach = function (client, bufnr)
--         on_attach()
--         if client.name == 'dcm' then
--             vim.o.tabstop = 2
--             vim.o.softtabstop = 2
--             vim.o.shiftwidth = 2
--             vim.o.expandtab = true
--         end
--     end,
--     capabilities = capabilities,
-- }

require("lspconfig").dartls.setup {
    on_attach = function (client, bufnr)
        on_attach()
        if client.name == 'dartls' then
            vim.o.tabstop = 2
            vim.o.softtabstop = 2
            vim.o.shiftwidth = 2
            vim.o.expandtab = true
        end
    end,
    capabilities = capabilities,
}

require("lspconfig").kotlin_language_server.setup {
    on_attach = function (client, bufnr)
        on_attach()
        if client.name == 'kotlin_language_server' then
            vim.o.tabstop = 2
            vim.o.softtabstop = 2
            vim.o.shiftwidth = 2
            vim.o.expandtab = true
        end
    end,
    capabilities = capabilities,
}

require('lspconfig').omnisharp.setup {
    on_attach = on_attach(),
    capabilities = capabilities
}
