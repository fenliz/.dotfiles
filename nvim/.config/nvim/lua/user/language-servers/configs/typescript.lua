local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.uri, "react/index.d.ts") == nil
end

return function(opts)
  local on_attach = opts.on_attach

  -- Disable builtin formatting in favor of null-ls
  opts.on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  opts.handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        result = vim.tbl_filter(function(v)
          return not string.find(v.uri, "react/index.d.ts")
        end, result)
      end

      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  }

  return opts
end
