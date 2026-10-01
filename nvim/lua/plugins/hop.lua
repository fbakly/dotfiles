return {
  src = "https://github.com/smoka7/hop.nvim",
  version = vim.version.range("*"),
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran",
    })

    local function hint(direction, offset)
      return function()
        require("hop").hint_char1({
          direction = direction,
          current_line_only = true,
          hint_offset = offset,
        })
      end
    end

    local HintDirection = require("hop.hint").HintDirection
    vim.keymap.set({ "n", "x", "o" }, "f", hint(HintDirection.AFTER_CURSOR), { remap = true, desc = "Hop forward to char" })
    vim.keymap.set({ "n", "x", "o" }, "F", hint(HintDirection.BEFORE_CURSOR), { remap = true, desc = "Hop backward to char" })
    vim.keymap.set({ "n", "x", "o" }, "t", hint(HintDirection.AFTER_CURSOR, -1), { remap = true, desc = "Hop forward till char" })
    vim.keymap.set({ "n", "x", "o" }, "T", hint(HintDirection.BEFORE_CURSOR, 1), { remap = true, desc = "Hop backward till char" })
    vim.keymap.set("n", "<leader><leader>w", function()
      require("hop").hint_words()
    end, { desc = "Hop to word" })
  end,
}
