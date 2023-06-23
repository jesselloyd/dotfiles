-- https://rosepinetheme.com/palette/
local palette = require("rose-pine.palette")

require("rose-pine").setup({
	highlight_groups = {
		TelescopeBorder = { fg = palette.highlight_high, bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = palette.base },
		TelescopeResultsNormal = { fg = palette.subtle, bg = "none" },
		TelescopeSelection = { fg = palette.text, bg = palette.base },
		TelescopeSelectionCaret = { fg = palette.rose, bg = palette.rose },
		FloatBorder = { fg = "none", bg = "none" },
		NormalFloat = { bg = "none" },
		StatusLine = { fg = palette.text, bg = palette.pine },
		StatusLineNC = { fg = palette.subtle, bg = palette.surface },
	},
})

vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = palette.love, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg = palette.gold, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg = palette.foam, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowOrange", { fg = palette.rose, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowGreen", { fg = palette.pine, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowViolet", { fg = palette.iris, ctermbg = 0 })

vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = palette.gold, ctermbg = 0 })
vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { sp = palette.gold, underline = true, ctermbg = 0 })

vim.api.nvim_set_hl(0, "TreesitterContext", { bg = palette.surface })
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = palette.highlight_high, underline = true })

vim.g.fzf_colors = {
	fg = { "fg", "Normal" },
	bg = { "bg", "Normal" },
	hl = { "fg", "Comment" },
	["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
	["bg+"] = { "bg", "CursorLine", "CursorColumn" },
	["hl+"] = { "fg", "Statement" },
	info = { "fg", "PreProc" },
	border = { "fg", "Ignore" },
	prompt = { "fg", "Conditional" },
	pointer = { "fg", "Exception" },
	marker = { "fg", "Keyword" },
	spinner = { "fg", "Label" },
	header = { "fg", "Comment" },
}

vim.opt.termguicolors = true

vim.cmd.syntax("on")
vim.cmd.colorscheme("rose-pine")

local shade = require("shade")

shade.setup()
