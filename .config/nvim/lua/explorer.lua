vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

-- restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		---@diagnostic disable-next-line: undefined-field
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})
