return {
  {
    src = "https://github.com/Shatur/neovim-ayu",
    priority = 100,
    config = function()
      require("ayu").setup({
        mirage = true,
        terminal = true,
      })
    end,
  },
  {
    src = "https://github.com/projekt0n/github-nvim-theme",
    name = "github-theme",
    priority = 100,
    config = function()
      require("github-theme").setup({})
    end,
  },
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin",
    priority = 100,
  },
}
