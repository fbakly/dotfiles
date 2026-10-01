return {
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-neotest/neotest-python" },
  {
    src = "https://github.com/nvim-neotest/neotest",
    config = function()
      local neotest = require("neotest")
      local neotest_python = require("neotest-python")
      neotest.setup({
        adapters = {
          neotest_python({
            dap = { justMyCode = false },
          }),
        },
      })
    end,
  },
}
