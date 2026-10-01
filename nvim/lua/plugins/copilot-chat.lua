return {
  { src = "https://github.com/nvim-lua/plenary.nvim", version = "master" },
  { src = "https://github.com/github/copilot.vim" },
  {
    src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
    build = function(path)
      if vim.fn.executable("make") == 0 then
        vim.notify("CopilotChat: skipped `make tiktoken` because `make` is not installed", vim.log.levels.WARN)
        return
      end
      local result = vim.system({ "make", "tiktoken" }, { cwd = path }):wait()
      if result.code ~= 0 then
        error(result.stderr ~= "" and result.stderr or result.stdout)
      end
    end,
    config = function()
      require("CopilotChat").setup({
        model = "claude-opus-4.8",
        temperature = 0.1,
        trusted_tools = nil,
        window = {
          layout = "vertical",
          width = 0.5,
        },
        auto_insert_mode = false,
        mappings = {
          complete = {
            insert = "<Tab>",
          },
        },
      })
    end,
  },
}
