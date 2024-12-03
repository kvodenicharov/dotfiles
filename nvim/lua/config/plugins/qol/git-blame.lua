return {
	"f-person/git-blame.nvim",
	init = function()
		vim.g.gitblame_display_virtual_text = 0
	end,
	event = "VeryLazy",
	opts = {
		enabled = true,
		message_template = " <summary> • <date> • <author>",
	},
}
