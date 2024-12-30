return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { silent = true },
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
}
