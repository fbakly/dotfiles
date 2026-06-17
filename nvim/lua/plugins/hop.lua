return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  keys = {
    {
      'f',
      function()
        require('hop').hint_char1({
          direction = require('hop.hint').HintDirection.AFTER_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { 'n', 'x', 'o' },
      remap = true,
      desc = 'Hop forward to char',
    },
    {
      'F',
      function()
        require('hop').hint_char1({
          direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
          current_line_only = true,
        })
      end,
      mode = { 'n', 'x', 'o' },
      remap = true,
      desc = 'Hop backward to char',
    },
    {
      't',
      function()
        require('hop').hint_char1({
          direction = require('hop.hint').HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        })
      end,
      mode = { 'n', 'x', 'o' },
      remap = true,
      desc = 'Hop forward till char',
    },
    {
      'T',
      function()
        require('hop').hint_char1({
          direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        })
      end,
      mode = { 'n', 'x', 'o' },
      remap = true,
      desc = 'Hop backward till char',
    },
    {
      '<leader><leader>w',
      function() require('hop').hint_words() end,
      desc = 'Hop to word',
    },
  },
}
