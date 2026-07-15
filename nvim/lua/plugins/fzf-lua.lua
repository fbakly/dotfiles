return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- 1. Initialize fzf-lua with your exact custom settings
    require("fzf-lua").setup({
      winopts = {
        fullscreen = true,
      },
      files = {
        fd_opts = [[--color=never --hidden --no-ignore --type f --type l --exclude .git]],
      }
    })

    -- 2. Hijack vim.ui.select to route CopilotChat into fzf-lua
    require("fzf-lua").register_ui_select()
  end
}
