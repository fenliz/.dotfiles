return function(use)
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Adapters
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest"),
        },
      })
    end,
  })
end
