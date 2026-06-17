return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "github/copilot.vim" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      model = 'claude-haiku-4.5', -- AI model to use
      temperature = 0.1,          -- Lower = focused, higher = creative
      trusted_tools = nil,        -- Require approval for all tool calls
      window = {
        layout = 'vertical',      -- 'vertical', 'horizontal', 'float'
        width = 0.5,              -- 50% of screen width
      },
      auto_insert_mode = false,   -- Enter insert mode when opening
    },
  },
}
