local cwd = vim.fn.getcwd() or ""
local cwd_in_dotfiles = string.match(cwd, ".dotfiles")

return {
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    opts = {
      hint = "floating-big-letter",
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = {
            "blink-cmp-documentation",
            "blink-cmp-menu",
            "blink-cmp-signature",
            "edgy",
            "neo-tree",
            "noice",
            "notify",
            "nvimtree",
            "smear-cursor",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "toggleterm",
            "trouble",
            "tutor",
          },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = not cwd_in_dotfiles,
          hide_hidden = not cwd_in_dotfiles,
        },
      },
      window = {
        mappings = {
          ["<cr>"] = "open_with_window_picker",
          ["l"] = "open_with_window_picker",
          ["h"] = "close_node",
        },
      },
    },
  },
}
