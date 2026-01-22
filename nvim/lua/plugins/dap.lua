return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "igorlfs/nvim-dap-view",
    -- "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "mason-org/mason.nvim",
    "mfussenegger/nvim-dap-python",
    'Weissle/persistent-breakpoints.nvim',
  },
  config = function()
    local dap = require "dap"
    require('dap-python').setup('python')
    require("dap-python").test_runner = "pytest"

    vim.keymap.set({ "n", "v" }, "<Leader>dt", function() require("dap-python").test_method() end)

    vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })



    require("nvim-dap-virtual-text").setup {
      -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
      display_callback = function(variable)
        local name = string.lower(variable.name)
        local value = string.lower(variable.value)
        if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
          return "*****"
        end

        if #variable.value > 15 then
          return " " .. string.sub(variable.value, 1, 15) .. "... "
        end

        return " " .. variable.value
      end,
    }

    local persistent_breakpoints = require("persistent-breakpoints")
    local persistent_breakpoints_api = require("persistent-breakpoints.api")
    persistent_breakpoints.setup {
      load_breakpoints_event = { "BufReadPost" }
    }

    vim.keymap.set("n", "<space>bb", persistent_breakpoints_api.toggle_breakpoint)
    vim.keymap.set("n", "<space>bc", persistent_breakpoints_api.set_conditional_breakpoint)
    vim.keymap.set("n", "<space>bg", dap.run_to_cursor)


    vim.keymap.set('n', '<F5>', dap.continue)
    vim.keymap.set('n', '<S-F5>', dap.terminate)
    vim.keymap.set('n', '<C-S-F5>', dap.restart)
    vim.keymap.set('n', '<F10>', dap.step_over)
    vim.keymap.set('n', '<F11>', dap.step_into)
    vim.keymap.set('n', '<F12>', dap.step_out)

    local dv = require("dap-view")
    local dv_opts = {
      winbar = {
        controls = {
          enabled = true
        }
      }
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
    vim.keymap.set('n', '<leader>dt', dv.toggle)


    -- local ui = require "dapui"
    -- require("dapui").setup()
    -- -- Eval var under cursor
    -- vim.keymap.set("n", "<space>?", function()
    --   require("dapui").eval(nil, { enter = true })
    -- end)

    -- vim.keymap.set('n', '<leader>dt', ui.toggle)

    -- dap.listeners.before.attach.dapui_config = function()
    --   ui.open()
    -- end
    -- dap.listeners.before.launch.dapui_config = function()
    --   ui.open()
    -- end
    -- dap.listeners.before.event_terminated.dapui_config = function()
    --   ui.close()
    -- end
    -- dap.listeners.before.event_exited.dapui_config = function()
    --   ui.close()
    -- end
  end,
}
