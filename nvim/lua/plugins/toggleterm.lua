return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminal = false,
      direction = "horizontal"
    })
  end
}
