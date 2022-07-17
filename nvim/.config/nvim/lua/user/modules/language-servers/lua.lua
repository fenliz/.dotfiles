return function(opts)
  opts.settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ":"),
      },
      diagnostics = {
        globals = { "vim", "nnoremap", "vnoremap", "inoremap", "tnoremap" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  }
end
