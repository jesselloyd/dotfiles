local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"sumneko_lua",
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
		tailwindCSS = {
			experimental = { classRegex = "tw`([^`]*)" },
		},
	},
})

lsp.setup()

vim.diagnostic.config({ virtual_text = true })
