-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({ "nvim-tree/nvim-web-devicons" })

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

	use({ "nvim-lualine/lualine.nvim" })

	use({ "akinsho/bufferline.nvim", tag = "*" })

	use({
		"folke/which-key.nvim",
		event = "VeryLazy",
	})

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

	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })

	use({ "hrsh7th/cmp-buffer" })

	use({ "kylechui/nvim-surround" })
	use({ "gbprod/substitute.nvim" })

	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
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
