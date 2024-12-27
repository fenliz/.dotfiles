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
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
    },
  },
}
