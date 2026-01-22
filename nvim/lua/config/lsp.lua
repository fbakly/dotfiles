-- local capabilities = require("blink.cmp").default_capabilities()

-- on_attach: set keymaps + format on save
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- local servers = { "basedpyright", "ruff", "mypy", "rust_analyzer", "json-lsp", "yamlls", "lua_ls" }
local servers = { "ty", "ruff", "rust_analyzer", "json-lsp", "yamlls", "lua_ls" }

-- Apply the defaults to each
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    -- capabilities = capabilities, -- Not needed when using blink.cmp
    on_attach = on_attach,
  })
  vim.lsp.enable(server)
end
