local lsp = require("lsp-zero").preset("recommended")

-- define global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
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
