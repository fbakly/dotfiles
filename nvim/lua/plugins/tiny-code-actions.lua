return {
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  {
    src = "https://github.com/rachartier/tiny-code-action.nvim",
    config = function()
      require("tiny-code-action").setup({
        backend = "vim",
        picker = "fzf-lua",
      })
    end,
  },
}
