return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    view = {
      centralize_selection = true,
      side = "left",
      float = {
        -- enable = true,
        quit_on_focus_loss = true,
      },
    },
  }
}
