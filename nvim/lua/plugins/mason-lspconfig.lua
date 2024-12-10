return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "mason.nvim", "cmp-nvim-lsp" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("mason-lspconfig").setup({})
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities
        })
      end,
    })
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
            end
          })
        end
      end,
    })
  end,
}
