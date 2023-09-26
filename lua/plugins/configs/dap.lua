local dap = require("dap")

dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = 13000,
    executable = {
      command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
      args = {"--port", "13000"}
    }
}

dap.configurations.c = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
        end,
        -- program = '${workspaceFolder}/program',
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
    }
}

dap.configurations.cpp = dap.configurations.c


