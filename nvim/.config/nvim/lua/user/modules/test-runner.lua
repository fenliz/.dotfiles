local M = {}

M.mappings = function()
  require("mapx").nname("<leader>t", "Test")

  nnoremap("<leader>tt", function()
    require("neotest").run.run()
  end, "<silent>", "Test: Nearest test")

  nnoremap("<leader>tf", function()
    require("neotest").run.run(vim.fn.expand("%"))
  end, "<silent>", "Test: Current file")

  nnoremap("<leader>tr", function()
    require("neotest").run.run_last()
  end, "<silent>", "Test: Rerun test")

  nnoremap("<leader>te", function()
    require("neotest").summary.toggle()
  end, "<silent>", "Test: Toggle explorer")

  nnoremap("<leader>tK", function()
    require("neotest").output.open()
  end, "<silent>", "Test: Show output")

  nnoremap("<leader>td", function()
    require("neotest").run.run({ strategy = "dap" })
  end, "<silent>", "Test: Debug nearest test")

  nnoremap("<leader>ts", function()
    require("neotest").run.stop()
  end, "<silent>", "Test: Stop nearest test")

  nnoremap("<leader>ta", function()
    require("neotest").run.attach()
  end, "<silent>", "Test: Attach nearest test")
end

M.plugins = function(use)
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
        discovery = {
          enabled = false,
        },
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

return M
