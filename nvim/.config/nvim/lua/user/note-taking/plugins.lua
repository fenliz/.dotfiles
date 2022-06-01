return function(use)
  use({
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.norg.concealer"] = {
            config = {
              preset = "diamond",
            },
          },
          ["core.norg.qol.toc"] = {
            config = {
              toc_split_placement = "right",
            },
          },
        },
      })
    end,
  })
end
