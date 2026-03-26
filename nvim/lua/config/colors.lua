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
end

ColorMeMaster()
