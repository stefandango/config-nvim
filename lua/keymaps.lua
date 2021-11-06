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
		-- nvimtree explorer toggle --> USE C-. instead
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
