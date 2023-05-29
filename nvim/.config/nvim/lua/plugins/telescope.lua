return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fl",
        -- stylua: ignore
        function() require('telescope.builtin').resume() end,
        desc = "Resume last search",
      },
    },
  },
  {
    "AckslD/nvim-neoclip.lua",
    keys = {
      {
        "<leader>fy",
        -- stylua: ignore
        function() require("telescope").extensions.neoclip.default() end,
        desc = "Clipboard",
      },
    },
    config = function()
      require("neoclip").setup({
        keys = {
          telescope = {
            i = {
              paste = "<cr>",
              select = "<C-y>",
            },
          },
        },
      })
    end,
  },
}
