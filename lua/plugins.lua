
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
  use {'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {
          auto_close = true,
          update_cwd = true
      } end
  }
--  vim.cmd('let g:nvim_tree_ignore = [ \'node_modules\', \'.cache\' ]')
  vim.cmd('let g:nvim_tree_highlight_opened_files = 1 ')
  vim.cmd('let g:nvim_tree_quit_on_open = 1')

  -- Theme
  use 'navarasu/onedark.nvim'
  vim.cmd('let g:onedark_style = \'warmer\'')

  --vim.cmd('colorscheme onedark')
  vim.g.onedark_transparent_background = true
  require('onedark').setup()

  -- lsp config (Autocomplete)
  use 'neovim/nvim-lspconfig'
  --use 'hrsh7th/nvim-compe'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'

-- NOT MAINTAINED...  use 'glepnir/lspsaga.nvim'
  use 'tami5/lspsaga.nvim'
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
--  use 'mhartington/formatter.nvim'
  --use telescope...

  -- Undotree for better view of changes of files
  use 'mbbill/undotree'

  -- Smooth scroll for crtl-d and crtl-u
  use 'psliwka/vim-smoothie'

-- COMMENT TOGGLE
--  use 'terrortylor/nvim-comment'
use 'tpope/vim-commentary'
--
--  use 'markwoodhall/vim-nuget'
  -- GIT
  --use 'tpope/vim-fugitive'
-- Experimental
--use 'OmniSharp/omnisharp-vim'
--use 'dense-analysis/ale'
end)
