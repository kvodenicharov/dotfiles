-- Global Config
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'

-- Keymaps
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", { noremap = true, silent = true })

vim.cmd([[
    autocmd StdinReadPre * let s:std_in=1

    " Open NT & focus main window
    autocmd VimEnter * NERDTree | wincmd p

    " Navigate to selected dir if passed as argument
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'NERDTree' argv()[0] | wincmd w | enew | execute 'cd '.argv()[0] | endif

    " Mirror tree on separate tabs
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

    " Close editor if NT is the only buffer left
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
]])
