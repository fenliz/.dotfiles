return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          capabilities = {
            textDocument = {
              documentHighlight = {
                enabled = false,
              },
            },
          },
        },
      },
    },
  },
}
