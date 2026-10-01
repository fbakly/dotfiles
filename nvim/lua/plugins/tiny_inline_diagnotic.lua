return {
  src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  config = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({ virtual_text = false })
  end,
}
