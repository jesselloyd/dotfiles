vim.g.mapleader = ','

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-n>', ':Lexplore<CR>')
vim.keymap.set('n', '<C-p>', ':FZF<CR>')
vim.keymap.set('n', 's', ':Rg<CR>')

vim.keymap.set('x', '<leader>p', [["_dP]])
