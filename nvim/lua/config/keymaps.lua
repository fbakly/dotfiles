vim.keymap.set('i', 'jk', '<Esc>')

local nvim_tree = require("nvim-tree.api")
vim.keymap.set('n', '<C-n>', nvim_tree.tree.toggle)

vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<C-b>', '<cmd>Telescope buffers<cr>')

vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.keymap.set("n", "<leader>gh", "<cmd>0Gclog!<CR>")

vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")

vim.keymap.set("n", "<C-h>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>resize +2<CR>")

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
vim.keymap.set('n', '<leader><leader>w', function()
  hop.hint_words()
end, { remap = true })
