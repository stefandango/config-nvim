-- https://github.com/LunarVim/LunarVim/blob/rolling/lua/keymappings.lua

local generic_opts_any = { noremap = true, silent = true }
local generic_opts = { 
	insert_mode = generic_opts_any,
	normal_mode = generic_opts_any,
	visual_mode = generic_opts_any,
	visual_block_mode = generic_opts_any,
	term_mode = { silent = true }
}

local mode_adapters = {
	insert_mode = "i",
	normal_mode = "n",
	term_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
}

-- Leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', generic_opts_any)
vim.g.mapleader = ' '


-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function Set_keymaps(mode, key, val)
  local opt = generic_opts[mode] and generic_opts[mode] or generic_opts_any
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function Load_mode(mode, keymaps)
  mode = mode_adapters[mode] and mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    Set_keymaps(mode, k, v)
  end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function Load(keymaps)
  for mode, mapping in pairs(keymaps) do
    Load_mode(mode, mapping)
  end
end

local keys = {
	insert_mode = {},
	normal_mode = {
		-- Better window navigation
		["<C-h>"] = "<C-w>h",
		["<C-j>"] = "<C-w>j",
		["<C-k>"] = "<C-w>k",
		["<C-l>"] = "<C-w>l",
		-- No hl
		["<Leader>h"] = ":set hlsearch!<CR>",
		-- nvimtree explorer toggle
		["<C-n>"] = ":NvimTreeToggle<CR>",
		-- Tab switch buffer
		["<S-l>"] = ":bnext<CR>",
		["<S-h>"] = ":bprevious<CR>",
		-- Resize with arrows
		["<C-Up>"] = ":resize -2<CR>",
		["<C-Down>"] = ":resize +2<CR>",
		["<C-Left>"] = ":vertical resize -2<CR>",
		["<C-Right>"] = ":vertical resize +2<CR>",
		-- Alternative Escape method
		["<C-c>"] = "<Esc>",
		-- Undotree plugin toggle
		["<F5>"] = ":UndotreeToggle<CR>" },
	visual_mode = {
		-- Better indenting
		["<"] = "<gv",
		[">"] = ">gv",
	}
}
-- Set keymaps!
Load(keys)

--[[
-- Leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', generic_opt_any)
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true})

-- nvimtree explorer toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})
]]
