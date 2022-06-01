local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local M = {}

M.format = function(entry, item)
  item.kind = string.format("%s", kind_icons[item.kind])

  item.menu = ({
    path = "[Path]",
    copilot = "[AI]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    luasnip = "[Snip]",
    emoji = "[Emoji]",
    buffer = "[Buf]",
  })[entry.source.name]

  return item
end

return M
