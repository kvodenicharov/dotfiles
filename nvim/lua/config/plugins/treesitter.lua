return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"python",
			"javascript",
			"typescript",
			"html",
			"css",
			"json",
			"yaml",
			"toml",
			"rust",
			"go",
			"dockerfile",
			"java",
			"lua",
			"make",
			"php",
			"terraform",
			"vim",
			"regex",
		},
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
