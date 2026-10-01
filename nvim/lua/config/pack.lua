-- One vim.pack.add() installs every plugin. Setup runs immediately after.
-- Install hooks are registered first so they also run when bootstrapping
-- from the lockfile.
--
-- vim.pack writes stdpath("config") .. "/nvim-pack-lock.json". Home-manager
-- deploys that path read-only, so it is a symlink to
-- stdpath("data") .. "/nvim-pack-lock.json" (~/.local/share/nvim).

if vim.pack == nil then
  error("vim.pack is unavailable; Neovim 0.12 or newer is required")
end

local function redirect_lockfile()
  local config_lock = vim.fs.joinpath(vim.fn.stdpath("config"), "nvim-pack-lock.json")
  local data_lock = vim.fs.joinpath(vim.fn.stdpath("data"), "nvim-pack-lock.json")
  vim.fn.mkdir(vim.fn.stdpath("data"), "p")

  if not vim.uv.fs_stat(data_lock) and vim.uv.fs_stat(config_lock) then
    local src = vim.uv.fs_stat(config_lock)
    local fd = vim.uv.fs_open(config_lock, "r", 438)
    if not fd then
      error("failed to read the pack lockfile at " .. config_lock)
    end
    local contents = vim.uv.fs_read(fd, src.size) or ""
    vim.uv.fs_close(fd)
    local out = vim.uv.fs_open(data_lock, "w", 438)
    if not out then
      error("failed to create the pack lockfile at " .. data_lock)
    end
    vim.uv.fs_write(out, contents)
    vim.uv.fs_close(out)
  end

  local existing = vim.uv.fs_stat(data_lock)
  if existing and bit.band(existing.mode, tonumber("200", 8)) == 0 then
    vim.uv.fs_chmod(data_lock, tonumber("644", 8))
  end

  local stat = vim.uv.fs_lstat(config_lock)
  if stat and stat.type == "link" and vim.uv.fs_readlink(config_lock) == data_lock then
    return
  end
  if stat then
    local ok, err = vim.uv.fs_unlink(config_lock)
    if not ok then
      error(("failed to replace read-only pack lockfile %s: %s"):format(config_lock, err))
    end
  end
  local ok, err = vim.uv.fs_symlink(data_lock, config_lock)
  if not ok then
    error(("failed to link the pack lockfile to %s: %s"):format(data_lock, err))
  end
end

redirect_lockfile()

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    elseif name == "CopilotChat.nvim" then
      if vim.fn.executable("make") == 0 then
        vim.notify("CopilotChat: skipped `make tiktoken` because `make` is not installed", vim.log.levels.WARN)
        return
      end
      local result = vim.system({ "make", "tiktoken" }, { cwd = ev.data.path }):wait()
      if result.code ~= 0 then
        local output = result.stderr ~= "" and result.stderr or result.stdout
        vim.notify("CopilotChat: make tiktoken failed\n" .. output, vim.log.levels.ERROR)
      end
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim", version = "master" },
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/lewis6991/async.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/antoinemadec/FixCursorHold.nvim",

  "https://github.com/Shatur/neovim-ayu",
  { src = "https://github.com/projekt0n/github-nvim-theme", name = "github-theme" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1.0.0") },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",

  { src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("*") },
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  { src = "https://github.com/s1n7ax/nvim-window-picker", version = vim.version.range("^2.0.0") },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
  "https://github.com/antosha417/nvim-lsp-file-operations",

  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/folke/trouble.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/LintaoAmons/scratch.nvim",

  { src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") },
  { src = "https://github.com/kylechui/nvim-surround", version = vim.version.range("*") },
  { src = "https://github.com/smoka7/hop.nvim", version = vim.version.range("*") },
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/lukas-reineke/indent-blankline.nvim",
  "https://github.com/karb94/neoscroll.nvim",
  "https://github.com/sotte/presenting.nvim",
  "https://github.com/mechatroner/rainbow_csv",
  "https://github.com/mfussenegger/nvim-jdtls",
  "https://github.com/ThePrimeagen/refactoring.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rachartier/tiny-code-action.nvim",
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  "https://github.com/github/copilot.vim",
  "https://github.com/CopilotC-Nvim/CopilotChat.nvim",

  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/mfussenegger/nvim-dap-python",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/igorlfs/nvim-dap-view",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
  "https://github.com/Weissle/persistent-breakpoints.nvim",
  "https://github.com/jay-babu/mason-nvim-dap.nvim",
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/nvim-neotest/neotest-python",
}, { confirm = false })

require("plugins.colorschemes")
require("plugins.treesitter")
require("plugins.blink-cmp")
require("plugins.mason")
require("plugins.fzf-lua")
require("plugins.neotree")
require("plugins.persistent-breakpoints")
require("plugins.dap")
require("plugins.mason-nvim-dap")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.gitsigns")
require("plugins.vim-fugitive")
require("plugins.neogit")
require("plugins.whichkey")
require("plugins.trouble")
require("plugins.todo-comments")
require("plugins.toggleterm")
require("plugins.nvim-surround")
require("plugins.hop")
require("plugins.nvim-autopairs")
require("plugins.ident-blankline")
require("plugins.neoscroll")
require("plugins.presenting")
require("plugins.refactoring")
require("plugins.render-markdown")
require("plugins.tiny-code-actions")
require("plugins.tiny_inline_diagnotic")
require("plugins.copilot-chat")
require("plugins.neotest")
