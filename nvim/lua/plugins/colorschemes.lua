require("ayu").setup({
  mirage = true,
  terminal = true,
})

require("github-theme").setup({})

require("catppuccin").setup({
  flavour = "mocha",
})
vim.cmd.colorscheme("catppuccin")
