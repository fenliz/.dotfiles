return {
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gfh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
  },
}
