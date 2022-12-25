vim.g.mapleader = ','

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-n>', vim.cmd.Lex)
vim.keymap.set('n', '<C-p>', ':FZF<CR>')
vim.keymap.set('n', 's', ':Rg<CR>')

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
