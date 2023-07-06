-- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.o.mouse = "" -- Disable mouse support
vim.o.scrolloff = 8 -- Keep 8 lines above and below cursor
vim.o.completeopt = "menu,menuone,noselect,noinsert" -- Completion options

vim.filetype.add({
  filename = {
    [".env"] = "sh",
    [".envrc"] = "sh",
    ["*.env"] = "sh",
    ["*.envrc"] = "sh",
  },
})

vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#fc9867", fg = "#000000" })
