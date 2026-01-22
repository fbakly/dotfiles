return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = { "mason.nvim", "nvim-dap" },
  config = function()
    require('mason-nvim-dap').setup({
      ensure_installed = { 'python' },
      handlers = { },
    })
  end
}
