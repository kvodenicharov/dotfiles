return {
	"theprimeagen/harpoon",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		require("telescope").load_extension("harpoon")
        vim.keymap.set("n", "<leader>fh", "<cmd>Telescope harpoon marks<CR>", { desc = "Harpoon Marks" })

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
		vim.keymap.set("n", "<leader>u", mark.rm_file, { desc = "Unmark File" })

		for i = 1, 9 do
		    vim.keymap.set("n", "<C-" .. i .. ">", function()
		        ui.nav_file(i)
		    end, { desc = "Harpoon Navigate to " .. i })
		end
	end,
}