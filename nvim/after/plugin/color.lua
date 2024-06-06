function ColorMeMaster(color)
	color = color

	vim.api.nvim_set_hl(0, 'normal', {bg = 'none'})
	vim.api.nvim_set_hl(0, 'normalFloat', {bg = 'none'})
end

ColorMeMaster(color)
