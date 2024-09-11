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
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
