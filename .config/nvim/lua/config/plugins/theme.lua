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
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				alpha = true,
				fzf = true,
				harpoon = true,
				indent_blankline = {
					enabled = true,
				},
				mini = {
					enabled = true,
				},
				noice = true,
				cmp = true,
				notify = true,
				nvim_surround = true,
				treesitter = true,
				rainbow_delimiters = true,
				snacks = {
					enabled = true,
				},
				which_key = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			background = {
				dark = "wave",
				light = "lotus",
			},
			colors = {
				palette = {
					dragonGreen2 = "#adc19c", -- strings: much brighter, more saturated green
					dragonPink = "#c4b3c5", -- numbers: more pronounced pink
					dragonOrange = "#d8b39c", -- constants: brighter, warmer orange
					dragonYellow = "#e6d4ac", -- identifiers: more golden yellow
					dragonGray = "#c8c8be", -- parameters: lighter but still neutral
					dragonBlue2 = "#acc5d1", -- functions: more vivid blue
					dragonViolet = "#aab3c8", -- statements/keywords: brighter violet
					dragonRed = "#e5958f", -- operators/preproc/regex: punchier red
					dragonAqua = "#afc5c3", -- types: clearer aqua tone
					dragonGray2 = "#bfbcb4", -- punctuation: increased contrast
					dragonAsh = "#939c93", -- comments: slightly brighter but still subtle
					dragonTeal = "#b5c0d6", -- special1: more vibrant teal
				},
			},
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			--vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
