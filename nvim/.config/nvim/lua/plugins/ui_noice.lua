return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          silent = true,
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "wrapped-compact",
    },
  },
}
