return {
  {
    "catgoose/do-the-needful.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufReadPre",
    keys = {
      { "<leader>r", "<cmd>Telescope do-the-needful please<cr>", "n" },
      { "<leader>R", "<cmd>Telescope do-the-needful<cr>", "n" },
    },
    opts = {
      ask_functions = {
        get_cwd = function()
          return vim.fn.getcwd()
        end,
        current_file = function()
          return vim.fn.expand("%")
        end,
      },
    },
  },
}
