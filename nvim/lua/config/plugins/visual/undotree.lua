return {
	"mbbill/undotree",
	config = function()
		vim.o.undofile = true
		vim.o.undodir = vim.fn.stdpath("data") .. "/undo"

		vim.keymap.set("n", "<leader>u", function()
			vim.cmd.UndotreeToggle()
			vim.cmd.UndotreeFocus()
		end, { desc = "Undo Tree Toggle and Focus" })
	end,
}
