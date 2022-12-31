local close_buffers = require("close_buffers")

close_buffers.setup()

vim.keymap.set("n", "<leader>cb", function()
	close_buffers.delete({ type = "hidden", force = true })
end, { desc = "[C]lear hidden [B]uffers" })
