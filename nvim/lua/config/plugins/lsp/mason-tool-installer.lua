return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		auto_update = true,
		run_on_start = true,
		start_delay = 3000,
		ensure_installed = {
			"lua-language-server",
			"vim-language-server",
			"sonarlint-language-server",
			"stylua",
			"shellcheck",
			"editorconfig-checker",
			"luacheck",
			"shellcheck",
			"shfmt",
			"vint",
		},
	},
}

