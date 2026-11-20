local dap = require('dap')
vim.keymap.set("n", "<leader>tb", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>tB",
    function()
        vim.ui.input({
            prompt = "Insert breakpoint condition: "
        },
        function(input)
            dap.toggle_breakpoint(input)
        end)
    end)
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
