return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.esupports.metagen"] = {},
				["core.highlights"] = {},
				["core.todo-introspector"] = {},
				["core.qol.todo_items"] = {
					config = {
						create_todo_parents = true,
						create_todo_items = true,
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
						name = "[Norg]",
					},
				},
				["core.integrations.nvim-cmp"] = {
					config = {
						sources = "neorg",
					},
				},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							cells = "~/work/org/cells",
						},
						index = "index.norg",
						default_workspace = "cells",
					},
				},
				["core.export"] = {},
				["core.summary"] = {
					config = {
						strategy = "by_path",
					},
				},
				["core.journal"] = {},
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
