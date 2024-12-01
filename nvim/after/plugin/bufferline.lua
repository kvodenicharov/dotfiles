require("bufferline").setup({
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
				filetype = "nerdtree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
			},
		},
	},
	vim.keymap.set("n", "<leader>bp", vim.cmd.BufferLinePick),
	vim.keymap.set("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>"),
	vim.keymap.set("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>"),
	vim.keymap.set("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>"),
	vim.keymap.set("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>"),
	vim.keymap.set("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>"),
	vim.keymap.set("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>"),
	vim.keymap.set("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>"),
	vim.keymap.set("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>"),
	vim.keymap.set("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>"),
	vim.keymap.set("n", "<leader>$", "<Cmd>BufferLineGoToBuffer -1<CR>"),
})
