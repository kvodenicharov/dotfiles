return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		opts = {
			defaults = {
				file_ignore_patterns = { ".git/" },
				layout_strategy = "horizontal",
				layout_config = { height = 0.95 },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					hidden = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		},
		config = function(_, opts)
			local tl = require("telescope")
			local tlC = require("telescope.config")

			local vg_args = { unpack(tlC.values.vimgrep_arguments) }
			table.insert(vg_args, "--hidden")
			table.insert(vg_args, "--glob")
			table.insert(vg_args, "!**/.git/*")
			opts.defaults.vimgrep_arguments = vg_args

			tl.setup(opts)
			tl.load_extension("fzf")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "Find Git Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find w/ Grep" })
			vim.keymap.set("n", "<leader>fx", builtin.treesitter, { desc = "Find TS" })
			vim.keymap.set("n", "<leader>fv", builtin.vim_options, { desc = "Find Vim Opts" })
			vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "Find Commands" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		end,
	},
}
