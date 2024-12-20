return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local theme = require("alpha.themes.theta")
		theme.file_icons.provider = "devicons"

		theme.header.val = {
			[[                       | | / /                            ]],
			[[                     \         /                          ]],
			[[                    \__   ____  /                         ]],
			[[                   /   \ /    \  |                        ]],
			[[   /|             /     |      \ \                        ]],
			[[  / |____________/     /        | |_____________///////// ]],
			[[ <  |____________|     |        |(______________       () ]],
			[[  \ |           /   () | ()     | |             \\\\\\\\\ ]],
			[[   \|           |    __|__      | |                       ]],
			[[               _|___/___  \___  | |                       ]],
			[[         __----         ----__\---\_                      ]],
			[[        /                        __ |                     ]],
			[[        \____-------------______/  \                      ]],
			[[           \_____| /____________                          ]],
			[[                 |/  |   |                                ]],
			[[                     |   |                                ]],
		}

		local alpha = require("alpha")
		alpha.setup(theme.config)

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
					alpha.start()
				end
			end,
		})
	end,
}
