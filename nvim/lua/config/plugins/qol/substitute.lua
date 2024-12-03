return {
	"gbprod/substitute.nvim",
	config = function()
		local s = require("substitute")
		s.setup({
			on_substitute = function()
				vim.cmd('echo "Substitution done"')
			end,
		})

		vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
		vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
		vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
		vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })
	end,
}

