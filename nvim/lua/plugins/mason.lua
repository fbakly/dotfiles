return {
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/saghen/blink.cmp" },
  {
    src = "https://github.com/mason-org/mason.nvim",
    priority = 70,
    config = function()
      require("mason").setup({})
    end,
  },
}
