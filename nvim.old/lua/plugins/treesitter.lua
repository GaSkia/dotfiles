return {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "query",
            "vimdoc",
            "cpp",
            --"csharp",
        },

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}
