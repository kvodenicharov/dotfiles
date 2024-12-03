return {
	"mbbill/undotree",
	config = function()
        vim.o.undofile = true
        vim.o.undodir = vim.fn.stdpath("data") .. "/undo"

		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree Toggle" })
	end,
}