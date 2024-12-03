return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.files").setup({
			windows = {
				preview = true,
				width_preview = 50,
			},
		})
		vim.keymap.set("n", "<leader>fe", "<cmd>lua MiniFiles.open()<CR>", { desc = "File Explorer" })

		require("mini.icons").setup()

		local notify = require("mini.notify")

		notify.setup()
		vim.notify = notify.make_notify({
			ERROR = { duration = 5000 },
			WARN = { duration = 4000 },
			INFO = { duration = 3000 },
		})
	end,
}

