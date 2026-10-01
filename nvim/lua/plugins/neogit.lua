return {
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/sindrets/diffview.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  {
    src = "https://github.com/NeogitOrg/neogit",
    config = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })
    end,
  },
}
