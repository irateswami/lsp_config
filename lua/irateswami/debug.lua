local dap = require('dap')
local dapui = require('dapui')
local dapgo = require('dap-go')

dapgo.setup()
dapui.setup()

--vim.keymap.set("n", "", function() dapui.open() end, opts)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint Condition: ')) end, opts)
vim.keymap.set("n", "<leader>dv", function() dap.step_over() end, opts)
vim.keymap.set("n", "<leader>di", function() dap.step_into() end, opts)
vim.keymap.set("n", "<leader>do", function() dap.step_out() end, opts)
vim.keymap.set("n", "<leader>dc", function() dap.continue() end, opts)

-- go specific stuff
vim.keymap.set("n", "<leader>dt", function() dapgo.debug_test() end, opts)
