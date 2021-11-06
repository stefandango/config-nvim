-- settings values = https://github.com/norcalli/nvim.lua
require('plugins')
require('keymaps')
--require('nvim-compe')
require('nvim-cmp')
require('lspsetup')
require('lspsagaconfig')
require('lsp_signature_config')
require('nvim-autopairs').setup{}
require'nvim-tree'.setup() require'lualine'.setup { options = {
        theme = 'onedark'
    }
}
--require('nvim_comment').setup({comment_empty = false})

vim.opt.termguicolors = true
require("bufferline").setup{}
require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
require('settings')
