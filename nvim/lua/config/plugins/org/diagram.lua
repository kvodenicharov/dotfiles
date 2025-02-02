return {
	"3rd/diagram.nvim",
	dependencies = {
		"3rd/image.nvim",
	},
	config = function()
		require("image").setup({})

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
}
