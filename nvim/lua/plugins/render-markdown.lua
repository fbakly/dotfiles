return {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-mini/mini.nvim" },
  {
    src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup({})
    end,
  },
}
