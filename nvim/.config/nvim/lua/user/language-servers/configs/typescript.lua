return function(opts)
  local on_attach = opts.on_attach

  -- Disable builtin formatting in favor of null-ls
  opts.on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
end
