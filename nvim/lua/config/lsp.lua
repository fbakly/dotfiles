-- local capabilities = require("blink.cmp").default_capabilities()

-- on_attach: set keymaps + format on save
local on_attach = function(client, bufnr)
  if client.server_capabilities.textDocumentSync then
    client.server_capabilities.textDocumentSync.save = { includeText = true }
  end

  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set({ "n", "x" }, "<leader>ca", function()
    require("tiny-code-action").code_action()
  end, { noremap = true, silent = true, buffer = bufnr })

  -- Format on save
  if client:supports_method("textDocument/formatting") then
    local group = vim.api.nvim_create_augroup("LspFormatOnSave_" .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.code_action { context = { only = { "source.organizeImports" } }, apply = true }
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- local servers = { "basedpyright", "ruff", "mypy", "rust_analyzer", "json-lsp", "yamlls", "lua_ls" }
local servers = { "ty", "ruff", "rust_analyzer", "json-lsp", "yamlls", "lua_ls", "taplo", "dotenv-linter" }

-- Load yaml schemas from a project-local file if present
local schemas_file = vim.fn.getcwd() .. "/.yamlls.json"
local schemas = {}
if vim.fn.filereadable(schemas_file) == 1 then
  local content = vim.fn.json_decode(vim.fn.readfile(schemas_file))
  schemas = (content or {})["yaml.schemas"] or {}
end

-- Per-server settings
local server_settings = {
  yamlls = {
    settings = {
      yaml = {
        schemas = schemas,
      },
    },
  },
}

-- Apply the defaults to each
for _, server in ipairs(servers) do
  local config = vim.tbl_deep_extend("force", {
    -- capabilities = capabilities, -- Not needed when using blink.cmp
    on_attach = on_attach,
  }, server_settings[server] or {})
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end
