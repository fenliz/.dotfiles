return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    dap.adapters.chrome = {
      type = "executable",
      command = "node",
      args = { os.getenv("THIRD_PARTY") .. "/vscode-chrome-debug/out/src/chromeDebug.js" },
    }

    dap.configurations.javascriptreact = {
      {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}",
      },
    }

    dap.configurations.typescriptreact = {
      {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}",
      },
    }
  end,
}
