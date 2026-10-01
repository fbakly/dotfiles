require("fzf-lua").setup({
  winopts = {
    fullscreen = true,
  },
  files = {
    fd_opts = [[--color=never --hidden --no-ignore --type f --type l --exclude .git]],
  },
})

require("fzf-lua").register_ui_select()
