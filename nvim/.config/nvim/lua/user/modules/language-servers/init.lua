local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local highlight_augroup = vim.api.nvim_create_augroup("LspHightlight", {})

local M = {}

M.on_attach = function(client, bufnr)
  -- Highlight
  if client.supports_method("textDocument/documentHighlight") then
    vim.api.nvim_clear_autocmds({ group = highlight_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd(
      "CursorHold",
      { group = highlight_augroup, buffer = bufnr, callback = vim.lsp.buf.document_highlight }
    )
    vim.api.nvim_create_autocmd(
      "CursorMoved",
      { group = highlight_augroup, buffer = bufnr, callback = vim.lsp.buf.clear_references }
    )
  end

  -- Formatting
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting_augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    nnoremap(
      "gf",
      function()
        vim.lsp.buf.format({ timeout_ms = 2000 })
      end,
      "<silent>",
      "Format file",
      {
        buffer = bufnr,
      }
    )
  end

  -- Actions
  nnoremap(
    "ga",
    function()
      vim.lsp.buf.code_action()
    end,
    "<silent>",
    "Code actions",
    {
      buffer = bufnr,
    }
  )

  vnoremap(
    "ga",
    function()
      vim.lsp.buf.code_action()
    end,
    "<silent>",
    "Code actions",
    {
      buffer = bufnr,
    }
  )

  nnoremap(
    "gr",
    function()
      vim.lsp.buf.rename()
    end,
    "<silent>",
    "Rename",
    {
      buffer = bufnr,
    }
  )

  -- Documentation/References
  nnoremap(
    "gR",
    function()
      vim.lsp.buf.references()
    end,
    "<silent>",
    "References",
    {
      buffer = bufnr,
    }
  )

  nnoremap(
    "gd",
    function()
      vim.lsp.buf.definition()
    end,
    "<silent>",
    "Definition",
    {
      buffer = bufnr,
    }
  )

  nnoremap(
    "gD",
    function()
      vim.lsp.buf.declaration()
    end,
    "<silent>",
    "Declaration",
    {
      buffer = bufnr,
    }
  )

  nnoremap(
    "gi",
    function()
      vim.lsp.buf.implementation()
    end,
    "<silent>",
    "Implementation",
    {
      buffer = bufnr,
    }
  )

  nnoremap(
    "K",
    function()
      vim.lsp.buf.hover()
    end,
    "<silent>",
    "Hover",
    {
      buffer = bufnr,
    }
  )
  nnoremap(
    "Ä",
    function()
      vim.diagnostic.goto_next()
    end,
    "<silent>",
    "Next diagnostic",
    {
      buffer = bufnr,
    }
  )
  nnoremap(
    "Ö",
    function()
      vim.diagnostic.goto_prev()
    end,
    "<silent>",
    "Previous diagnostic",
    {
      buffer = bufnr,
    }
  )
end

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
        on_attach = require("user.modules.language-servers").on_attach,
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
