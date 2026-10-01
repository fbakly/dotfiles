return {
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  {
    src = "https://github.com/folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
}
