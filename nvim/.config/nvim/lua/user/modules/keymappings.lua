local M = {}

M.plugins = function(use)
  use({
    "b0o/mapx.nvim",
    requires = { "folke/which-key.nvim", "mrjones2014/legendary.nvim" },
    config = function()
      require("legendary").setup()
      require("mapx").setup({
        global = "force",
        whichkey = true,
      })
      require("user").mappings()
    end,
  })
end

return M
