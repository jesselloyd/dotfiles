vim.opt.mouse = "a"

vim.keymap.set("n", "<RightMouse>", [[<Nop>]])
vim.keymap.set("n", "<RightDrag>", [[<Cmd>lua require("gesture").draw({ show_board = false })<CR>]], { silent = true })
vim.keymap.set("n", "<RightRelease>", [[<Cmd>lua require("gesture").suspend()<CR>]], { silent = true })
vim.keymap.set("n", "<2-RightMouse>", [[<Cmd>lua require("gesture").finish()<CR>]], { silent = true })

local gesture = require("gesture")
