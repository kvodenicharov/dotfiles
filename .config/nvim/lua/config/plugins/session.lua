return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		enabled = true,
		auto_restore = false,
		auto_restore_last_session = false,
		suppressed_dirs = { "~/", "~/Downloads", "/", "~/work" },
	},
	config = function(_, opts)
		require("auto-session").setup(opts)

		vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Session Restore" })
		vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Session Save" })
		vim.keymap.set("n", "<leader>wf", "<cmd>SessionSearch<CR>", { desc = "Session Search" })
	end,
}
