-- Set tabs as spaces
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.incsearch = true
-- Set line numbers
vim.wo.number = true

--Enable Mouse mod
vim.o.mouse = 'a'

vim.cmd(':set colorcolumn=80')
vim.cmd('set nobackup')
vim.cmd('set undodir=undodir')
vim.cmd('set undofile')
vim.cmd('set listchars=tab:›\\ ,eol:¬,trail:⋅')
vim.cmd('set list')
vim.cmd('set nu')
vim.cmd('set relativenumber')
vim.cmd('set hidden')
vim.cmd('set noerrorbells')
vim.cmd('set scrolloff=8')
vim.cmd('set signcolumn=yes')

vim.wo.wrap = false
vim.wo.cursorline = true
