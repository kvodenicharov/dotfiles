return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		automatic_installation = true,
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		},
	},
	config = function(_, opts)
		local mlc = require("mason-lspconfig")
		mlc.setup(opts)

		mlc.setup_handlers({
			function(server)
				require("lspconfig")[server].setup({})
			end,
		})
	end,
}

