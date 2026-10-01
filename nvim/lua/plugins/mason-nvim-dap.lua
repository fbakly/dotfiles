return {
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mfussenegger/nvim-dap" },
  {
    src = "https://github.com/jay-babu/mason-nvim-dap.nvim",
    priority = 40,
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python" },
        handlers = {},
      })
    end,
  },
}
