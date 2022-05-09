lua << EOF

require('lualine').setup{
	options = {
		theme = 'everforest',
		section_separators = {'', ''},
		component_separators = {'', ''}
	}
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require'nvim-tree'.setup()

require('nvim-autopairs').setup()

require('Comment').setup(
	{
		ignore = '^$',
	}
)

require('toggleterm').setup{
	open_mapping = [[<c-\>]],
	shade_terminal = false
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-f>"] = trouble.open_with_trouble },
      n = { ["<c-f>"] = trouble.open_with_trouble },
    },
  },
}

require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
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
	  ["<C-n>"] = cmp.mapping(function(fallback)
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

	["<C-p>"] = cmp.mapping(function(fallback)
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

require'lspconfig'.pyright.setup{ 
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.clangd.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.texlab.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

local dap, dapui = require("dap"), require("dapui")

require('dap-python').setup('~/projects/debugpy/Scripts/python.exe')
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
  justMyCode = false,
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

EOF
