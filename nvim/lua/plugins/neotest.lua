local neotest = require("neotest")
local neotest_python = require("neotest-python")
neotest.setup({
  adapters = {
    neotest_python({
      dap = { justMyCode = false },
    }),
  },
})
