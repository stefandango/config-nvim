-- settings values = https://github.com/norcalli/nvim.lua
require('plugins')
require('keymaps')
require('nvim-compe')
require('lspsetup')
require('nvim-autopairs').setup{}
require'lualine'.setup {
    options = {
        theme = 'onedark'
    }
}
vim.opt.termguicolors = true
require("bufferline").setup{}

require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
require('settings')
