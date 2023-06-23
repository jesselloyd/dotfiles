local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	"folke/neodev.nvim",
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-commentary",
	"rose-pine/neovim",
	"sunjon/shade.nvim",
	"kazhala/close-buffers.nvim",
	"ray-x/lsp_signature.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"mfussenegger/nvim-dap",
	"David-Kunz/jester",
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	"nvim-tree/nvim-tree.lua",
	"notomo/gesture.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				dependencies = {
					"williamboman/mason.nvim",
					"williamboman/mason-lspconfig.nvim",
				},
			},
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-nvim-lua",
				},
			},
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
	},
	{
		"folke/twilight.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"HiPhish/nvim-ts-rainbow2",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = vim.fn.executable("make") == 1,
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
	},
})
