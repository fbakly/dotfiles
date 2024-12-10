return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "rcasia/neotest-java",
  },
  opts = {
    adapters = {

      ["neotest-python"] = {
        dap = { justMyCode = false },
      },
      ["neotest-java"] = {
      }
    }
  },
}
