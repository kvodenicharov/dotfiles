return {
	"m4xshen/hardtime.nvim",
	enabled = false,
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		restriction_mode = "hint",
		disabled_filetypes = "norg",
		disable_mouse = false, -- Warp-fuckery resolved!
		disabled_keys = {
			["<Up>"] = { "n" },
			["<Down>"] = { "n" },
			["<Left>"] = { "n" },
			["<Right>"] = { "n" },
		},
		resetting_keys = {
			["<"] = {},
			[">"] = {},
		},
	},
}
