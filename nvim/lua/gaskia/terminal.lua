vim.api.nvim_open_term({'TermRequest'}, {
    desc = 'Handles OSC 7 dir change request',
    callback = function(ev)
        if string.sub(vim.v.termrequest, 1, 4) == '\x1b]7;' then
            local dir = string.gsub(vim.v.termrequest, '\x1b]7;file://[^/]*', ''
})
