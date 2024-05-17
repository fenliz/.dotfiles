vim.api.nvim_create_augroup("filetype", {})

-- Treat .swiftinterface files as Swift files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.swiftinterface",
  group = "filetype",
  command = "setlocal filetype=swift",
})
