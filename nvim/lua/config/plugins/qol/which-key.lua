return {
	"folke/which-key.nvim",
	opts = {
		preset = "modern"
	},
	config = function(_, opts)
		require("which-key").setup(opts)

		vim.keymap.set(
			"n",
			"<leader>?",
			[[<Cmd>lua require("which-key").show({ global = false })<CR>]],
			{ noremap = true, silent = true, desc = "Buffer Local Keymaps (which-key)" }
		)

		vim.keymap.set(
		    "n",
		    "<leader>g?",
		    [[<Cmd>lua require("which-key").show({ global = true })<CR>]],
		    { noremap = true, silent = true, desc = "Global Keymaps (which-key)" }
		)
	end,
}