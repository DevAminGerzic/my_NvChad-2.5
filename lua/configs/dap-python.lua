local python = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

require("dap-python").setup(python)

vim.keymap.set("n", "<leader>dpr", function()
    require("dap-python").test_method()
end, { desc = "Debug: Python test method" })
