return {
	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {},
	},
	{
		"3rd/diagram.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		config = function()
			require("diagram").setup({
				integrations = {
					require("diagram.integrations.markdown"),
					require("diagram.integrations.neorg"),
				},
				renderer_options = {
					mermaid = {
						background = "transparent",
						theme = "dark",
						scale = 2,
					},
				},
			})
		end,
	},
}
