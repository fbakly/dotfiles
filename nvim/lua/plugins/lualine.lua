return {
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  {
    src = "https://github.com/nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        theme = "auto",
        section_separators = { "", "" },
        component_separators = { "", "" },
      })
    end,
  },
}
