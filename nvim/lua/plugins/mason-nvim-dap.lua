return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = { "mason.nvim", "nvim-dap" },
  config = function()
    require('mason-nvim-dap').setup({
      ensure_installed = { 'python' },
      handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
      },
    })
  end
}
