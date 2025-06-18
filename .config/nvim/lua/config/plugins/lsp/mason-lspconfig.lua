return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		automatic_installation = true,
	},
	config = function(_, opts)
		local mlc = require("mason-lspconfig")
		mlc.setup(opts)
	end,
}
