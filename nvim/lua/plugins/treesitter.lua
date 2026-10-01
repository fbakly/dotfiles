require("nvim-treesitter.config").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "java", "rust", "cpp", "c_sharp" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
