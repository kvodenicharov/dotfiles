return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.esupports.metagen"] = {
					config = {
						type = "auto",
					},
				},
				["core.qol.todo_items"] = {
					config = {
						create_todo_items = true,
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							yotpo = "~/work/org/yotpo",
							personal = "~/work/org/personal",
						},
						index = "index.norg",
						default_workspace = "yotpo",
					},
				},
				["core.export"] = {},
				["core.summary"] = {},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>nlk",
			"<Plug>(neorg.core.looking-glass.magnify-code-block)",
			{ desc = "Code block: Magnify" }
		)

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
