-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

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

	--[[
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				enabled = false,
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
    ]]
	--

	use({ "nvim-lualine/lualine.nvim" })

	use({ "akinsho/bufferline.nvim", tag = "*" })

	use({ "folke/which-key.nvim" })

	use({ "goolord/alpha-nvim" })
	use({ "preservim/nerdtree" })
	use({ "Xuyuanp/nerdtree-git-plugin" })

	use({ "tiagofumo/vim-nerdtree-syntax-highlight" })

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
end)
