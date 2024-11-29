require("which-key").setup({
	preset = "modern",
})

vim.keymap.set(
	"n",
	"<leader>?",
	[[<Cmd>lua require("which-key").show({ global = false })<CR>]],
	{ noremap = true, silent = true, desc = "Buffer Local Keymaps (which-key)" }
)
