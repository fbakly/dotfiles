return {
  src = "https://github.com/nvim-treesitter/nvim-treesitter",
  version = "main",
  priority = 90,
  build = function()
    vim.cmd("TSUpdate")
  end,
  config = function()
    local configs = require("nvim-treesitter.config")
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "java", "rust", "cpp", "c_sharp" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
