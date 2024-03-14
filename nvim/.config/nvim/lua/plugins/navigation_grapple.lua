return {
  {
    "cbochs/grapple.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      scope = "git",
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>sq", "<cmd>Telescope grapple tags<cr>", desc = "Grapple tags" },
    },
    config = function()
      require("grapple").setup()
      require("telescope").load_extension("grapple")
    end,
  },
}
