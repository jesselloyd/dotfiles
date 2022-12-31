local telescope = require("telescope")
telescope.setup()

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Search (grep)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
