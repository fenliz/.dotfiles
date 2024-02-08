return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      integrations = {
        mason = true,
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        octo = true,
        which_key = true,
        window_picker = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
