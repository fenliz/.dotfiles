return {
  {
    "rareitems/printer.nvim",
    opts = {
      keymap = "gp",
      formatters = {
        typescriptreact = function(text_inside, text_var)
          return string.format('console.log("%s = ", %s)', text_inside, text_var)
        end,
      },
    },
  },
}
