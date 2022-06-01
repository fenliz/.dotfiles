return function(use)
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })

  use({
    "kdheepak/lazygit.nvim",
  })
end
