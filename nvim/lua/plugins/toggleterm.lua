return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-M-\>]],
      shade_terminal = false,
      direction = "tab"
      -- direction = "float"
    })
  end
}
