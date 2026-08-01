vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.foldenable = false
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_lines = true,
    always = true,
    float = {
        severity_sort = true,
        border = "rounded",
        source = true,
    },
})
-- vim.opt.mouse = ""

vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 8


vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "c",
        "python",
        "rust",
        "ron",
        "javascript",
        "c_sharp",
        'xml',
        'css',
        'gdscript',
    },
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,

})
vim.api.nvim_create_autocmd('FileType',
{
    pattern = 'python',
    callback = function()
        vim.opt.colorcolumn = '80'
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.api.nvim_create_autocmd('FileType',
{
    pattern = 'typescriptreact',
    callback = function()
        vim.o.tabstop = 2
        vim.o.softtabstop = 2
        vim.o.shiftwidth = 2
        vim.opt.colorcolumn = '80'
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.uxml",
    command = "set filetype=xml"
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.uss",
    command = "set filetype=css"
})
