require("trouble").setup({
	vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>"),
	vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>"),
})
