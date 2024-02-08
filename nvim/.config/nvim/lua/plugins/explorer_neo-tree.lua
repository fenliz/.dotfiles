local cwd = vim.fn.getcwd() or ""
local cwd_in_dotfiles = string.match(cwd, ".dotfiles")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = not cwd_in_dotfiles,
          hide_hidden = not cwd_in_dotfiles,
        },
      },
      follow_current_file = {
        enabled = true,
      },
      window = {

        mappings = {
          ["<c-cr>"] = "open_vsplit",
          ["l"] = "open_with_window_picker",
          ["h"] = "close_node",
        },
      },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    opts = {
      show_prompt = false,
      filter_rules = {
        autoselect_one = true,
      },
    },
  },
}
