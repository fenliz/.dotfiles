return {
  {
    "folke/noice.nvim",
    opts = {
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
