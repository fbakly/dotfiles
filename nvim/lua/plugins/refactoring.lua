return {
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/lewis6991/async.nvim" },
  {
    src = "https://github.com/ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup({
        prompt_func_return_type = {
          go = true,
          java = true,
          cpp = true,
          c = true,
          h = true,
          hpp = true,
          cxx = true,
          python = true,
        },
        prompt_func_param_type = {
          go = true,
          java = true,
          cpp = true,
          c = true,
          h = true,
          hpp = true,
          cxx = true,
          python = true,
        },
        printf_statements = {},
        print_var_statements = {},
        show_success_message = false,
      })

      local function map(lhs, kind, desc)
        vim.keymap.set({ "n", "x" }, lhs, function()
          return require("refactoring").refactor(kind)
        end, { expr = true, desc = desc })
      end

      map("<leader>re", "Extract Function", "Extract Function")
      map("<leader>rf", "Extract Function To File", "Extract Function To File")
      map("<leader>rv", "Extract Variable", "Extract Variable")
      map("<leader>rI", "Inline Function", "Inline Function")
      map("<leader>ri", "Inline Variable", "Inline Variable")
      map("<leader>rbb", "Extract Block", "Extract Block")
      map("<leader>rbf", "Extract Block To File", "Extract Block To File")
    end,
  },
}
