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
