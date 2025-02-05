return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		automatic_installation = true,
	},
	config = function(_, opts)
		local mlc = require("mason-lspconfig")
		mlc.setup(opts)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local handlers = {
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				local lspconfig = require("lspconfig")
				lspconfig.lua_ls.setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = {
									"vim",
									"require",
								},
							},
							workspace = {
								--library = vim.api.nvim_get_runtime_file("", true),
							},
						},
					},
				})
			end,
		}

		mlc.setup_handlers(handlers)
	end,
}
