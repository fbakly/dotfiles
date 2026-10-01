return {
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  {
    src = "https://github.com/s1n7ax/nvim-window-picker",
    version = vim.version.range("^2.0.0"),
    priority = 80,
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
          },
          use_libuv_file_watcher = true,
          follow_current_file = {
            enabled = true,
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
          },
        },
        window = {
          mappings = {
            ["P"] = function(state)
              local node = state.tree:get_node()
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end,
          },
        },
      })
      vim.keymap.set("n", "<C-n>", ":Neotree toggle reveal left<cr>")
    end,
  },
  {
    src = "https://github.com/antosha417/nvim-lsp-file-operations",
    priority = 40,
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
