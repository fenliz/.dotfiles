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
      routes = {
        -- Show macro recording messages
        {
          view = "notify",
          filter = { event = "msg_showmode" },
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
