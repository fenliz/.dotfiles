local toggleterm = require("toggleterm")

local function open_terminal_at_node(node)
  vim.notify(vim.inspect(node))
  toggleterm.exec_command("cwd=" .. node.absolute_path)
end

return function(use)
  use({
    "kyazdani42/nvim-tree.lua",
    tag = "nightly",
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 40,
          hide_root_folder = true,
          mappings = {
            list = {
              { key = "t", action = "open_terminal", action_cb = open_terminal_at_node },
              { key = "l", action = "edit" },
              { key = "h", action = "close_node" },
              { key = "<C-t>", action = "" },
            },
          },
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
      })
    end,
  })
end
