return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = false,
			terminal_colors = true,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)

			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			background = {
				dark = "dragon",
				light = "lotus",
			},
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)

			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
