return {
  "echasnovski/mini.surround",
  keys = { "gs" },
  opts = {
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
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
