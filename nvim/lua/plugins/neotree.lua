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

require("lsp-file-operations").setup()
