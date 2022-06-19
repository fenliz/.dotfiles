return function(use)
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      local nvim_tree = require("nvim-tree")
      local nvim_tree_cb = require("nvim-tree.config").nvim_tree_callback

      nvim_tree.setup({
        view = {
          width = 40,
          hide_root_folder = true,
          mappings = {
            list = {
              { key = "l", cb = nvim_tree_cb("edit") },
              { key = "h", cb = nvim_tree_cb("close_node") },
            },
          },
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
          highlight_opened_files = "all",
        },
      })
    end,
  })
end
