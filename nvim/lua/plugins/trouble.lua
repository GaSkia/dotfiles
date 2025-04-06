return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)"
        },
        {
            -- FIX: fix auto_refresh 
            "<leader>d",
            "<cmdTrouble todo toggle autorefresh=true<cr>",
            desc = "Load todo list (Trouble)"
        }
    },
}
