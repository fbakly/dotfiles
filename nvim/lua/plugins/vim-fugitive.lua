vim.api.nvim_create_user_command("Gmylog", function()
  vim.cmd("terminal git log --oneline --decorate --graph --all")
end, {})
