return function(use)
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Adapters
      "haydenmeade/neotest-jest",

      -- TEMP: Until neotest-jest works
      "vim-test/vim-test",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          -- require("neotest-jest"),
          require("neotest-vim-test")({
            ignore_filetypes = { "python", "lua" },
          }),
        },
        icons = {
          passed = "✅",
          failed = "❎",
          running = "🔃",
          skipped = "🔲",
        },
      })
    end,
  })
end
