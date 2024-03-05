return {
  {
    "dmmulroy/ts-error-translator.nvim",
    event = "BufReadPre",
    config = function()
      require("ts-error-translator").setup()
    end,
  },
}
