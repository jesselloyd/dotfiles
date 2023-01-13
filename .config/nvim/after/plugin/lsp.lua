local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"sumneko_lua",
	"tsserver",
	"eslint",
	"rust_analyzer",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

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

lsp.configure("eslint", {
	settings = {
		autoFixOnSave = true,
	},
	codeActionsOnSave = {
		mode = "all",
	},
})

lsp.configure("tailwindcss", {
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
	virtual_text = false,
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
