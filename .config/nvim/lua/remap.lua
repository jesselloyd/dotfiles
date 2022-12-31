vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-n>", vim.cmd.Lex)

vim.keymap.set("x", "<S-p>", [["_dP]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
