local telescope = require("telescope")
telescope.setup({
	pickers = { find_files = { hidden = true } },
})

telescope.load_extension("fzf")
telescope.load_extension("dap")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>/", builtin.oldfiles, { desc = "[<leader>/] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "/", function()
	builtin.current_buffer_fuzzy_find(themes.get_dropdown({ previewer = false }))
end, { desc = "[/] Fuzzily search in current buffer]" })
vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Show [K]ey [M]aps" })
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "[C-p] Search Files" })
vim.keymap.set("n", "s", builtin.live_grep, { desc = "[S]earch by Grep" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
