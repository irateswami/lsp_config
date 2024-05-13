local dap = require('dap')
local dapui = require('dapui')
local dapgo = require('dap-go')

dapui.setup()
dapgo.setup({
     dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
    },
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "38695",
    args = {},
    build_flags = "",
    detached = true
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

--vim.keymap.set("n", "", function() dapui.open() end, opts)
vim.keymap.set("n", "<leader>DC", ':lua require("nvim-dap-projects").search_project_config()<CR>')
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end)
vim.keymap.set("n", "<leader>dv", function() dap.step_over() end)
vim.keymap.set("n", "<leader>di", function() dap.step_into() end)
vim.keymap.set("n", "<leader>do", function() dap.step_out() end)
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)

-- go specific stuff
vim.keymap.set("n", "<leader>dt", function() dapgo.debug_test() end)
vim.keymap.set("n", "<leader>dl", function() dapgo.debug_last_test() end)
