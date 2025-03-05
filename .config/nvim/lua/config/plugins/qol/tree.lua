return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})

		local api = require("nvim-tree.api")
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
			callback = function(args)
				-- Only proceed if the buffer has a path and is a .norg file
				local filepath = vim.fn.expand("%:p")
				if filepath ~= "" and filepath:match("%.norg$") then
					vim.api.nvim_del_autocmd(args.id)
					vim.cmd("noautocmd NvimTreeOpen")
					vim.schedule(function()
						api.tree.expand_all()
						vim.cmd("noautocmd wincmd p")
					end)
				end
			end,
		})
		vim.keymap.set("n", "<leader>ft", api.tree.toggle, { desc = "File Tree" })
	end,
}
