-- Global Config
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Keymaps
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", { noremap = true, silent = true })


-- AUTOCMDs
-- Detect input from stdin
vim.api.nvim_create_autocmd("StdinReadPre", {
    callback = function()
        vim.g.std_in = 1
    end
})

-- Open NERDTree on VimEnter if no files are opened
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 and not vim.g.std_in then
            vim.cmd("NERDTree")
        end
    end
})

-- Close Neovim if NERDTree is the only window left
vim.cmd([[
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
]])

-- Focus file if Neovim is opened with a file arg
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("NERDTree")
        if vim.fn.argc() > 0 or vim.g.std_in then
            vim.cmd("wincmd p")
        end
    end
})

-- Handle buffer switching with NERDTree
vim.cmd([[
    au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') != '' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | wincmd w | blast | endif
]])

-- Open the existing NERDTree on each new tab
vim.cmd([[
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
]])
