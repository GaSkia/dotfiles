return {
    'hrsh7th/nvim-cmp',
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e'] = cmp.mapping.abort(),
                ['<C-n>'] = cmp.mapping.select_next_item({ cmp.SelectBehavior.Select }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ cmp.SelectBehavior.Select }),
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
                { name = 'buffer' },
            }),
        })
    end,
}
