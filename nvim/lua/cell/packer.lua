local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "nvim-tree/nvim-web-devicons" })

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	})

	use({ "windwp/nvim-ts-autotag" })

	use({ "lukas-reineke/indent-blankline.nvim" })

	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				enabled = true,
				auto_restore = false,
				auto_restore_last_session = false,
				suppressed_dirs = { "~/", "~/Downloads", "/" },

				vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }),
				vim.keymap.set(
					"n",
					"<leader>ws",
					"<cmd>SessionSave<CR>",
					{ desc = "Save session for auto session root dir" }
				),
			})
		end,
	})

	use({ "nvim-lualine/lualine.nvim" })

	use({ "akinsho/bufferline.nvim", tag = "*" })

	use({ "folke/which-key.nvim" })

	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	})

	use({
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.files").setup({
				windows = {
					preview = true,
					width_preview = 50,
				},
				vim.keymap.set("n", "<leader>fe", "<cmd>lua MiniFiles.open()<CR>", { desc = "File Explorer" }),
			})
			require("mini.icons").setup()

			local notify = require("mini.notify")

			notify.setup()
			vim.notify = notify.make_notify({
				ERROR = { duration = 5000 },
				WARN = { duration = 4000 },
				INFO = { duration = 3000 },
			})
		end,
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "theprimeagen/harpoon" })
	use({ "mbbill/undotree" })
	use({ "terryma/vim-multiple-cursors" })

	use({ "folke/trouble.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })

	use({ "hrsh7th/cmp-buffer" })

	use({ "kylechui/nvim-surround" })
	use({ "gbprod/substitute.nvim" })

	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })

	use({
		"mfussenegger/nvim-lint",
		as = "lint",
	})
	use({ "rshkarin/mason-nvim-lint" })
	use({ "stevearc/conform.nvim" })

	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
