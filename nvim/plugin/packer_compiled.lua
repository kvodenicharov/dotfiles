-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/kiril.vodenicharov/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/Users/kiril.vodenicharov/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/Users/kiril.vodenicharov/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/Users/kiril.vodenicharov/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/kiril.vodenicharov/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n]\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\23alpha.themes.theta\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\n¢\3\0\0\t\0\16\1\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0'\a\v\0005\b\f\0B\3\5\2>\3\1\0026\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\r\0'\a\14\0005\b\15\0B\3\5\0?\3\0\0B\0\2\1K\0\1\0\1\0\1\tdesc+Save session for auto session root dir\25<cmd>SessionSave<CR>\15<leader>ws\1\0\1\tdesc\28Restore session for cwd\28<cmd>SessionRestore<CR>\15<leader>wr\6n\bset\vkeymap\bvim\20suppressed_dirs\1\4\0\0\a~/\16~/Downloads\6/\1\0\4\30auto_restore_last_session\1\17auto_restore\1\fenabled\2\20suppressed_dirs\0\nsetup\17auto-session\frequire\5€€À™\4\0" },
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["conform.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  lint = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-nvim-lint"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/mason-nvim-lint",
    url = "https://github.com/rshkarin/mason-nvim-lint"
  },
  ["mason-tool-installer.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  nerdtree = {
    config = { "\27LJ\2\n­\v\0\0\6\0\23\0-6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\21\0'\2\22\0B\0\2\1K\0\1\0ì\a                autocmd StdinReadPre * let s:std_in=1\n\n                \" Open NT & focus main window\n                autocmd VimEnter * NERDTree | wincmd p\n\n                \" Navigate to selected dir if passed as argument\n                autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |\n                    \\ execute 'NERDTree' argv()[0] | wincmd w | execute \"Alpha\" | execute 'cd '.argv()[0] | endif\n\n                \" Mirror tree on separate tabs\n                autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif\n\n                \" Close editor if NT is the only buffer left\n                autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(\":quit\\<CR>:\\<BS>\") | endif\n                autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(\":quit\\<CR>:\\<BS>\") | endif\n            \bcmd\1\0\2\fnoremap\2\vsilent\2\22:NERDTreeFind<CR>\n<C-f>\1\0\2\fnoremap\2\vsilent\2\24:NERDTreeToggle<CR>\n<C-t>\1\0\2\fnoremap\2\vsilent\2\18:NERDTree<CR>\n<C-n>\1\0\2\fnoremap\2\vsilent\2\23:NERDTreeFocus<CR>\14<leader>n\6n\bset\vkeymap\bâ–¾ NERDTreeDirArrowCollapsible\bâ–¸\31NERDTreeDirArrowExpandable\6g\bvim\0" },
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin",
    url = "https://github.com/Xuyuanp/nerdtree-git-plugin"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["substitute.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  tokyonight = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/tokyonight",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors",
    url = "https://github.com/terryma/vim-multiple-cursors"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight",
    url = "https://github.com/tiagofumo/vim-nerdtree-syntax-highlight"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/kiril.vodenicharov/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n¢\3\0\0\t\0\16\1\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0026\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\n\0'\a\v\0005\b\f\0B\3\5\2>\3\1\0026\3\6\0009\3\a\0039\3\b\3'\5\t\0'\6\r\0'\a\14\0005\b\15\0B\3\5\0?\3\0\0B\0\2\1K\0\1\0\1\0\1\tdesc+Save session for auto session root dir\25<cmd>SessionSave<CR>\15<leader>ws\1\0\1\tdesc\28Restore session for cwd\28<cmd>SessionRestore<CR>\15<leader>wr\6n\bset\vkeymap\bvim\20suppressed_dirs\1\4\0\0\a~/\16~/Downloads\6/\1\0\4\30auto_restore_last_session\1\17auto_restore\1\fenabled\2\20suppressed_dirs\0\nsetup\17auto-session\frequire\5€€À™\4\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: tokyonight
time([[Config for tokyonight]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight")
time([[Config for tokyonight]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\23alpha.themes.theta\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\n­\v\0\0\6\0\23\0-6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\18\0'\4\19\0005\5\20\0B\0\5\0016\0\0\0009\0\21\0'\2\22\0B\0\2\1K\0\1\0ì\a                autocmd StdinReadPre * let s:std_in=1\n\n                \" Open NT & focus main window\n                autocmd VimEnter * NERDTree | wincmd p\n\n                \" Navigate to selected dir if passed as argument\n                autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |\n                    \\ execute 'NERDTree' argv()[0] | wincmd w | execute \"Alpha\" | execute 'cd '.argv()[0] | endif\n\n                \" Mirror tree on separate tabs\n                autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif\n\n                \" Close editor if NT is the only buffer left\n                autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(\":quit\\<CR>:\\<BS>\") | endif\n                autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(\":quit\\<CR>:\\<BS>\") | endif\n            \bcmd\1\0\2\fnoremap\2\vsilent\2\22:NERDTreeFind<CR>\n<C-f>\1\0\2\fnoremap\2\vsilent\2\24:NERDTreeToggle<CR>\n<C-t>\1\0\2\fnoremap\2\vsilent\2\18:NERDTree<CR>\n<C-n>\1\0\2\fnoremap\2\vsilent\2\23:NERDTreeFocus<CR>\14<leader>n\6n\bset\vkeymap\bâ–¾ NERDTreeDirArrowCollapsible\bâ–¸\31NERDTreeDirArrowExpandable\6g\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
