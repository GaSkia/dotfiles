local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({--})
--require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

--------------------
-- AUTOCOMPLETION --
--------------------

local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    
    --------------
    -- MAPPINGS --
    --------------
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behaviour = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behaviour = 'select'}),
    }
})



local cmp_select = {behavior = cmp.SelectBehavior.Select}

--lsp.set_preferences
