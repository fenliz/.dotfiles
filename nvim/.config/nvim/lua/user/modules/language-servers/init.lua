local M = {}

M.plugins = function(use)
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      -- "ray-x/lsp_signature.nvim",
      "nvim-lua/plenary.nvim",
      "j-hui/fidget.nvim",
      "simrat39/rust-tools.nvim",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local opts = {
        capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
        on_attach = require("user.modules.language-servers.on_attach"),
      }

      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      vim.diagnostic.config({
        signs = { active = signs },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          -- style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })

      require("user.modules.language-servers.null-ls")(opts)

      -- require("lsp_signature").setup({ hint_enable = false })
      require("fidget").setup({})

      require("nvim-lsp-installer").on_server_ready(function(server)
        if server.name == "sumneko_lua" then
          require("user.modules.language-servers.lua")(opts)
        elseif server.name == "tsserver" then
          require("user.modules.language-servers.typescript")(opts)
        elseif server.name == "jsonls" then
          require("user.modules.language-servers.json")(opts)
        elseif server.name == "omnisharp" then
          require("user.modules.language-servers.csharp")(opts)
        elseif server.name == "rust_analyzer" then
          require("user.modules.language-servers.rust")(server, opts)
          server:attach_buffers()
          return
        end

        server:setup(opts)
      end)
    end,
  })
end

return M
