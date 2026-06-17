vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<C-p>', function() require("fzf-lua").files() end)
vim.keymap.set('n', '<leader>/', function() require("fzf-lua").live_grep() end)
vim.keymap.set('n', '<C-b>', function() require("fzf-lua").buffers() end)
vim.keymap.set("n", "<leader>gb", function() require("fzf-lua").git_branches() end)
vim.keymap.set("n", "<leader>gc", function() require("fzf-lua").git_commits() end)
vim.keymap.set("n", "<leader>gr", function() require("fzf-lua").lsp_references() end)
vim.keymap.set("n", "<leader>ds", function() require("fzf-lua").lsp_document_symbols() end)


vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')

vim.keymap.set("n", "<leader>gh", "<cmd>0Gclog!<CR>")

vim.keymap.set("n", "<C-h>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>resize +2<CR>")

vim.keymap.set("n", "<M-C-n>", "<cmd>Scratch<cr>")
vim.keymap.set("n", "<M-C-o>", "<cmd>ScratchOpen<cr>")
