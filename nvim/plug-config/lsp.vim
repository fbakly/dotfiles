lua << EOF

require('lualine').setup{
	options = {
		theme = 'everforest',
		section_separators = {'', ''},
		component_separators = {'', ''}
	}
}

require'nvim-tree'.setup()

require('nvim-autopairs').setup()

require('toggleterm').setup{
	open_mapping = [[<c-\>]],
	shade_terminal = false
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local luasnip = require("luasnip")
local cmp = require("cmp")
require'cmp'.setup({
	snippet = {
	  expand = function(args)
		-- For `vsnip` user.
		-- vim.fn["vsnip#anonymous"](args.body)
		-- For `luasnip` user.
		require('luasnip').lsp_expand(args.body)
		-- For `ultisnips` user.
		-- vim.fn["UltiSnips#Anon"](args.body)
	  end,
	},
	mapping = {
	  ['<C-d>'] = require'cmp'.mapping.scroll_docs(-4),
	  ['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
	  ['<C-Space>'] = require'cmp'.mapping.complete(),
	  ['<C-e>'] = require'cmp'.mapping.close(),
	  ['<CR>'] = require'cmp'.mapping.confirm({ select = true }),
	  ["<Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_next_item()
		  elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		  elseif has_words_before() then
			cmp.complete()
		  else
			fallback()
		  end
		end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.select_prev_item()
		  elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		  else
			fallback()
		  end
		end, { "i", "s" }),
	},
	sources = {
	  { name = 'nvim_lsp' },
	  -- For vsnip user.
	  -- { name = 'vsnip' },
	  -- For luasnip user.
	   { name = 'luasnip' },
	  -- For ultisnips user.
	  -- { name = 'ultisnips' },
	  { name = 'buffer' },
	}
})

require'lspconfig'.sumneko_lua.setup{
	cmd = {"/usr/bin/lua-language-server"},
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.pyright.setup{ 
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.gopls.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.clangd.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.texlab.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

EOF
