return function(use)
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "ray-x/lsp_signature.nvim",
      "j-hui/fidget.nvim",
      "simrat39/rust-tools.nvim",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local opts = {
        flags = { debounce_text_changes = 150 },
        capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
        on_attach = require("user.language-servers.on_attach"),
      }

      require("user.language-servers.diagnostics")
      require("user.language-servers.configs.null-ls")(opts)

      require("lsp_signature").setup({ hint_enable = false })
      require("fidget").setup({})

      require("nvim-lsp-installer").on_server_ready(function(server)
        if server.name == "sumneko_lua" then
          require("user.language-servers.configs.lua")(opts)
        elseif server.name == "tsserver" then
          require("user.language-servers.configs.typescript")(opts)
        elseif server.name == "jsonls" then
          require("user.language-servers.configs.json")(opts)
        elseif server.name == "omnisharp" then
          require("user.language-servers.configs.csharp")(opts)
        elseif server.name == "rust_analyzer" then
          require("user.language-servers.configs.rust")(server, opts)
          server:attach_buffers()
          return
        end

        server:setup(opts)
      end)
    end,
  })

  use({
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup({})
    end,
  })
end
