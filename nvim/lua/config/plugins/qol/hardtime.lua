return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
		restriction_mode = "hint",
		disable_mouse = false, -- Warp-fuckery resolved!
		disabled_keys = {
			["<Up>"] = { "n" },
			["<Down>"] = { "n" },
			["<Left>"] = { "n" },
			["<Right>"] = { "n" },
		},
	},
}
