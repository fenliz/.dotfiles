return {
  {
    "echasnovski/mini.surround",
    keys = { "s" },
  },
  {
    "echasnovski/mini.align",
    keys = { "ga" },
  },
  {
    "echasnovski/mini.splitjoin",
    keys = {
      {
        "gS",
        -- stylua: ignore
        function() require("mini.splitjoin").toggle() end,
        desc = "Split/join arguments",
      },
    },
  },
}
