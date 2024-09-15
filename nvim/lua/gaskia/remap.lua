vim.g.mapleader = ';'
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<leader>n', function()
	if (vim.o.relativenumber) then
		vim.o.relativenumber = false
	else
		vim.o.relativenumber = true
	end
end)
