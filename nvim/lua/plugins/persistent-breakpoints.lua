return {
  src = "https://github.com/Weissle/persistent-breakpoints.nvim",
  priority = 80,
  config = function()
    require("persistent-breakpoints").setup({})
  end,
}
