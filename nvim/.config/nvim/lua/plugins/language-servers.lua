return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "actionlint",
        "eslint_d",
        "lua-language-server",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
        "typescript-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "<c-k>", false } -- Diable signature help in insert mode
    end,
  },
}
