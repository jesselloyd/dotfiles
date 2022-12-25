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

require('lazy').setup({
  'nvim-lua/plenary.nvim',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'tpope/vim-commentary',
  'rose-pine/neovim',
  { 'nvim-treesitter/nvim-treesitter',
    init = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'ray-x/lsp_signature.nvim',
  'VonHeikemen/lsp-zero.nvim',
  'jose-elias-alvarez/null-ls.nvim'
})
