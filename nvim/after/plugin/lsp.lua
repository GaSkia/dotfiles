local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'pyright',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y'] = cmp.mapping.confirm({ select = true }),
	['<C-Space'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
	print("help")
	local opts = {buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local function language_specific(client)
    if client.name == 'pyright' or vim.tbl.contains(client.filetypes, 'python') then
        vim.opt.colorcolumn = "72"
    end
end

lspconfig.pyright.setup({
    on_attach = language_specific
})

-- require 'lspconfig'.pyright.setup{
--     settings = {
--         pyright = {
--             disableOrgainzeImports = true,
--             reportMissingImports = true,
--             reportMissingTypeStubs = true,
--             typeCheckingMode = "strict",
--         },
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--                 diagnosticMode = "workspace",
--                 logLevel = "Information",
--                 messageLevel = "Information"
--             }
--         }
--     }
-- }

lsp.setup()
