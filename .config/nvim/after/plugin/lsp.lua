local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'sumneko_lua'
})

-- Fix undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true })
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local bind = vim.keymap.set

  bind('n', 'gd', vim.lsp.buf.definition, opts)
  bind('n', 'gD', vim.lsp.buf.declaration, opts)
  bind('n', 'gi', vim.lsp.buf.implementation, opts)
  bind('n', 'go', vim.lsp.buf.type_definition, opts)
  bind('n', 'gr', vim.lsp.buf.references, opts)
  bind('n', 'K', vim.lsp.buf.hover, opts)
  bind('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
  bind('n', '<leader>d', vim.diagnostic.open_float, opts)
  bind('n', '[d', vim.diagnostic.goto_prev, opts)
  bind('n', ']d', vim.diagnostic.goto_next, opts)
  bind('n', '<leader>ac', vim.lsp.buf.code_action, opts)
  bind('n', '<F2>', vim.lsp.buf.rename, opts)
  bind('i', '<C-k>', vim.lsp.buf.signature_help, opts)
end)

local config = require('lspconfig')

config.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = { classRegex = 'tw`([^`]*)' }
    }
  }
})

lsp.setup()

vim.diagnostic.config({ virtual_text = true })
