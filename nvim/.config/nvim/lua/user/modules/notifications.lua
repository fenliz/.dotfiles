local M = {}

M.plugins = function(use)
  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        render = "minimal",
        timeout = 1000,
      })
    end,
  })
end

return M
