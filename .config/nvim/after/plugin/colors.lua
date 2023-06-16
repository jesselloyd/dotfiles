-- https://rosepinetheme.com/palette/
require("rose-pine").setup({
	highlight_groups = {
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
		FloatBorder = { fg = "none", bg = "none" },
		NormalFloat = { bg = "none" },
		StatusLine = { fg = "iris", bg = "iris", blend = 10 },
		StatusLineNC = { fg = "subtle", bg = "surface" },
	},
})

vim.cmd.syntax("on")

vim.cmd.colorscheme("rose-pine")

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

vim.opt.guicursor = ""

vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.showtabline = 0

vim.opt.laststatus = 3 -- global
vim.opt.statusline = " %f %m %= %l:%c ⚡ "

local palette = require("rose-pine.palette")

vim.api.nvim_set_hl(0, "TSRainbowRed", { fg = palette.love, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowYellow", { fg = palette.gold, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowBlue", { fg = palette.foam, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowOrange", { fg = palette.rose, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowGreen", { fg = palette.pine, ctermbg = 0 })
vim.api.nvim_set_hl(0, "TSRainbowViolet", { fg = palette.iris, ctermbg = 0 })

vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = palette.gold, ctermbg = 0 })
vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { sp = palette.gold, underline = true, ctermbg = 0 })
