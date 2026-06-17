return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch = "main",   -- Ensure this is 'main'
  config = function()
    local configs = require("nvim-treesitter.config")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "java", "rust", "cpp", "c_sharp" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
