function ColorMeMaster(color)
    color = color or 'tokyonight'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, 'normal', {bg = 'none'})
	vim.api.nvim_set_hl(0, 'normalFloat', {bg = 'none'})
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', {
        underdashed = true,
        undercurl = false,
    })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {
        undercurl = true,
    })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
        underline = true,
        undercurl = false,
    })
    vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {
        underdotted = true,
        undercurl = false,
    })
    vim.api.nvim_set_hl(0, 'LineNrAbove', {fg='#a9b1d6', bold=false})
    vim.api.nvim_set_hl(0, 'LineNr', {fg='#c0caf5', bold=true})
    vim.api.nvim_set_hl(0, 'LineNrBelow', {fg='#a9b1d6', bold=false})
end

ColorMeMaster()
