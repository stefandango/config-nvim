  local cmp = require'cmp'
  local lspkind = require'lspkind'
  lspkind.init()
  
  cmp.setup({
    completion = {completeopt = 'menu,menuone,noinsert'},
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
--      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert,
      		select = true }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'buffer', keyword_length = 5 },
    },
    formatting = {
    format = lspkind.cmp_format({
	    with_text = true, 
	    maxwidth = 50,
	    menu = {
		    buffer = "[buf]",
		    nvim_lsp = "[LSP]",
		    nvim_lua = "[api]",
		    path = "[path]"
	    }
    }),
  },
  experimental = {
	native_menu = false,
	ghost_text = true,
  },
  })
