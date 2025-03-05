return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			separator_style = "slope",
			numbers = "ordinal",
			hover = {
				enabled = true,
				delay = 100,
				reveal = { "close" },
			},
			offsets = {
				{
					filetype = "undotree",
					text = "UndoTree",
					separator = true,
				},
				{
					filetype = "NvimTree",
					text = "File Explorer",
					separator = true,
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLinePick)
		vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
		vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
		vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
		vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
		vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
		vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Buffer 6" })
		vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Buffer 7" })
		vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Buffer 8" })
		vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Buffer 9" })
		vim.keymap.set("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>", { desc = "Buffer Last" })
		vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Buffer Next" })
		vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Buffer Previous" })
		vim.keymap.set("n", "<leader>bc", "<Cmd>bdelete<CR>", { desc = "Buffer Close" })
		vim.keymap.set("n", "<leader>bx", "<Cmd>BufferLinePickClose<CR>", { desc = "Buffer Pick to Close" })
	end,
}
