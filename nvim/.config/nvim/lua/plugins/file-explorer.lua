return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["l"] = "open_with_window_picker",
          ["<cr>"] = "open_with_window_picker",
          ["h"] = "close_node",
        },
      },
      filesystem = {
        hide_dotfiles = vim.fn.getcwd() ~= vim.env.DOTFILES,
        hide_hidden = vim.fn.getcwd() ~= vim.env.DOTFILES,
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    opts = {
      show_prompt = false,
      other_win_hl_color = "#ffd866",
      fg_color = "#19181a",
    },
  },
}