return {
    'nvim-treesitter/playground',
    cmd = "TSPlaygroundToggle",  -- Ensures Lazy loads it only when you run this command
    dependencies = { 'nvim-treesitter/nvim-treesitter' },  -- Ensure Treesitter is loaded
    opts = {
        -- Settings for the playground
        enable = true,         -- Enables the playground module
        disable = {},          -- List of languages to disable the playground for
        updatetime = 25,       -- Debounced time for highlighting nodes in the playground
        persist_queries = false, -- Whether playground persists queries across sessions
    },
}
