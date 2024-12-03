vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
