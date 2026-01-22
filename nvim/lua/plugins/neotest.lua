return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    local neotest = require("neotest")
    local neotest_python = require("neotest-python")
    neotest.setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false }
        })
      }
    })
  end
}
