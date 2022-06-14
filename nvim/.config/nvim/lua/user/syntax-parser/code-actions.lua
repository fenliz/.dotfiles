local null_ls = require("null-ls")

null_ls.register({
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "http" },
  generator = {
    fn = function()
      return {
        {
          title = "Run request",
          action = function()
            require("rest-nvim").run(false)
          end,
        },
        {
          title = "Preview request",
          action = function()
            require("rest-nvim").run(true)
          end,
        },
        {
          title = "Rerun last request",
          action = function()
            require("rest-nvim").last()
          end,
        },
      }
    end,
  },
})
