local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
  install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Nvim Tree
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  vim.cmd('let g:nvim_tree_auto_close = 1')
  vim.cmd('let g:nvim_tree_ignore = [ \'node_modules\', \'.cache\' ]')
  vim.cmd('let g:nvim_tree_highlight_opened_files = 1 ')
  vim.cmd('let g:nvim_tree_update_cwd = 1')
  vim.cmd('let g:nvim_tree_quit_on_open = 1')

  -- Theme
  use 'navarasu/onedark.nvim'
  vim.cmd('let g:onedark_style = \'warmer\'')
  --vim.cmd('colorscheme onedark')
  vim.g.onedark_transparent_background = true
  require('onedark').setup()

  -- lsp config (Autocomplete)
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  -- lualine
  use {
  'hoob3rt/lualine.nvim',
     requires = {'kyazdani42/nvim-web-devicons', opt = true}
   }
   -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run ='TSUpdate' }
  -- Bufferline (top tab visual)
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  -- Autopairs
  use 'windwp/nvim-autopairs'
  use 'Yggdroot/indentLine'
  --use 'mhartington/formatter.nvim'
  --use ...lps saga
  --use telescope...
  -- Undotree for better view of changes of files
  use 'mbbill/undotree'

  -- Smooth scroll for crtl-d and crtl-u
  use 'psliwka/vim-smoothie'

end)
