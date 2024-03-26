local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-CR>"] = actions.select_vertical,
          },
        },
      },
    },
  },
}
