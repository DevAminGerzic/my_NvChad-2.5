local dap = require("dap")

dap.adapters.codelldb = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
}

dap.configurations.cpp = {
    {
        name = "Debug C++ executable",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp

local map = vim.keymap.set

map("n", "<F5>", dap.continue, { desc = "Debug: start / continue" })
map("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: step out" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: breakpoint" })
map("n", "<leader>dq", dap.terminate, { desc = "Debug: stop" })
