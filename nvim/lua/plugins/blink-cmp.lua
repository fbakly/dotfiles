require("blink.cmp").setup({
  keymap = { preset = "default" },
  signature = { enabled = true },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust" },
})
