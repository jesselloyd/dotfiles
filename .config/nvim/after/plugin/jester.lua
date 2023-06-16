local jester = require("jester")

jester.setup({
	cmd = "yarn jest -t '$result' -- $file",
})

vim.keymap.set("n", "<F6>", jester.run, { desc = "[F6] Run nearest test(s) under the cursor" })
