require("nvim-treesitter.configs").setup({
	ensure_installed = { "help", "javascript", "typescript", "lua" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		strategy = require("ts-rainbow").strategy.global,
	},
})

require("treesitter-context").setup()
