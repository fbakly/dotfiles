return {
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  {
    src = "https://github.com/ibhagwan/fzf-lua",
    priority = 80,
    config = function()
      require("fzf-lua").setup({
        winopts = {
          fullscreen = true,
        },
        files = {
          fd_opts = [[--color=never --hidden --no-ignore --type f --type l --exclude .git]],
        },
      })

      require("fzf-lua").register_ui_select()
    end,
  },
}
