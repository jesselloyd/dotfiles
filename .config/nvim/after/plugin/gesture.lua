vim.opt.mouse = "a"

local gesture = require("gesture")

vim.keymap.set("n", "<RightMouse>", [[<Nop>]])
vim.keymap.set("n", "<RightDrag>", function() gesture.draw({ show_board = false }) end, { silent = true })
vim.keymap.set("n", "<RightRelease>", function() gesture.suspend() end, { silent = true })
vim.keymap.set("n", "<2-RightMouse>", function() gesture.finish() end, { silent = true })
