local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"sumneko_lua",
	"tsserver",
	"eslint",
	"rust_analyzer",
})

-- Fix undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local config = require("lspconfig")

config.tailwindcss.setup({
	settings = {
		editor = {
			quickSuggestions = { strings = true },
			autoClosingQuotes = "always",
		},
		tailwindCSS = {
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
				},
			},
			includeLanguages = {
				typescript = "javascript",
				typescriptreact = "javascript",
			},
		},
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})
