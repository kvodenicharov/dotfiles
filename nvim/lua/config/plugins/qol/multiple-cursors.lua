return {
	"mg979/vim-visual-multi",
	config = function(_, opts)
        -- Keymaps for Visual Multi actions
        vim.keymap.set("n", "<leader>va", ":MultiAdd<CR>", { desc = "Cursor Add" })
        vim.keymap.set("n", "<leader>vd", ":MultiRemove<CR>", { desc = "Cursor Remove" })
        vim.keymap.set("n", "<leader>vf", ":MultiFind<CR>", { desc = "Cursor Find Word and Add" })
        vim.keymap.set("n", "<leader>ve", ":MultiEdit<CR>", { desc = "Curor Edit Multiple" })
    end,
}