local null_ls = require("null-ls")

local lsp_formatting = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		-- formatting
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd,
		-- diagnostics
		null_ls.builtins.diagnostics.eslint,
		-- code actions
		null_ls.builtins.code_actions.eslint_d,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = lsp_formatting, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_formatting,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(c)
							return c.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
