local signs = require("gitsigns")

signs.setup({
	numhl = true,
	linehl = true,
	-- word_diff = true,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 50,
		ignore_whitespace = true,
	},
	on_attach = function(bufnr)
		local function set_git_status()
			vim.opt.statusline = "(⎇  "
				.. vim.api.nvim_buf_get_var(bufnr, "gitsigns_head")
				.. ") "
				.. vim.api.nvim_buf_get_var(bufnr, "gitsigns_status")
				.. " %f %m %= %l:%c ⚡ "
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = set_git_status,
		})

		set_git_status()
	end,
})
