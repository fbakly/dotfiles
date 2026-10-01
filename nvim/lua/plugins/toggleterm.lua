return {
  src = "https://github.com/akinsho/toggleterm.nvim",
  version = vim.version.range("*"),
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-M-\>]],
      shade_terminal = false,
      direction = "tab",
    })
  end,
}
