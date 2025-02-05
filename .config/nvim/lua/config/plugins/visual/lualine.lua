return {
	"nvim-lualine/lualine.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"f-person/git-blame.nvim",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 4 } },
			lualine_x = {
				{ require("gitblame").get_current_blame_text, cond = require("gitblame").is_blame_text_available },
				"encoding",
				"filetype",
			},
			lualine_y = { "location" },
			lualine_z = {
				{
					require("noice").api.status.command.get,
					cond = require("noice").api.status.command.has,
				},
			},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
