return {
  { src = "https://github.com/igorlfs/nvim-dap-view" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mfussenegger/nvim-dap-python" },
  { src = "https://github.com/Weissle/persistent-breakpoints.nvim" },
  {
    src = "https://github.com/mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      require("dap-python").setup("debugpy-adapter")
      require("dap-python").test_runner = "pytest"

      vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
      vim.fn.sign_define("DapBreakpointCond", { text = "🟠" })
      vim.fn.sign_define("DapBreakpointRej", { text = "⭕" })
      vim.fn.sign_define("DapLogPoint", { text = "🔵" })
      vim.fn.sign_define("DapStopped", { text = "🟡", linehl = "DapStoppedLine" })
      vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e2e2e" })

      require("nvim-dap-virtual-text").setup({
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
            return "*****"
          end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
        virt_text_pos = "eol",
      })

      local persistent_breakpoints = require("persistent-breakpoints")
      local persistent_breakpoints_api = require("persistent-breakpoints.api")
      persistent_breakpoints.setup({
        load_breakpoints_event = { "BufReadPost" },
      })

      vim.keymap.set("n", "<space>bb", persistent_breakpoints_api.toggle_breakpoint)
      vim.keymap.set("n", "<space>bc", persistent_breakpoints_api.set_conditional_breakpoint)
      vim.keymap.set("n", "<space>bg", dap.run_to_cursor)

      vim.keymap.set("n", "<leader>dc", function()
        require("dap.ext.vscode").load_launchjs(nil, {})
        require("fzf-lua").dap_configurations()
      end)

      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F7>", dap.terminate)
      vim.keymap.set("n", "<F8>", dap.restart)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)

      local dv = require("dap-view")
      local dv_opts = {
        winbar = {
          controls = {
            enabled = true,
          },
        },
      }

      dv.setup(dv_opts)

      dap.listeners.before.attach["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.launch["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.event_terminated["dap-view-config"] = function()
        dv.close()
      end
      dap.listeners.before.event_exited["dap-view-config"] = function()
        dv.close()
      end
      vim.keymap.set("n", "<leader>dt", dv.toggle)
    end,
  },
}
