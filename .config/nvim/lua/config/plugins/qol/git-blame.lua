return {
	"f-person/git-blame.nvim",
	init = function()
		vim.g.gitblame_display_virtual_text = 0
	end,
	event = "VeryLazy",
	opts = {
		enabled = true,
		date_format = "%d-%m-%Y %H:%M:%S",
		message_template = " <summary> • <date> • <author>",
	},
}
