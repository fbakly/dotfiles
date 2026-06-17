return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      fullscreen = true,
    },
    files = {
      fd_opts = [[--color=never --hidden --no-ignore --type f --type l --exclude .git]],
    }
  }
}
