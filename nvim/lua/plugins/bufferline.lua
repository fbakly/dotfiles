return {
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  {
    src = "https://github.com/akinsho/bufferline.nvim",
    version = vim.version.range("*"),
    config = function()
      require("bufferline").setup({})
    end,
  },
}
