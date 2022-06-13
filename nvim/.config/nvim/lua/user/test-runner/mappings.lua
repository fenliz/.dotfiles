local mapx = require("mapx")

mapx.nname("<leader>t", "Test")

nnoremap("<leader>tt", ':lua require("neotest").run.run()<CR>', "<silent>", "Test: Nearest test")
nnoremap("<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', "<silent>", "Test: Current file")
nnoremap("<leader>tr", ':lua require("neotest").run.run_last()<CR>', "<silent>", "Test: Rerun test")
nnoremap("<leader>ts", ':lua require("neotest").summary.toggle()<CR>', "<silent>", "Test Summary: Toggle")

nnoremap(
  "<leader>td",
  ':lua require("neotest").run.run({ strategy = "dap" })<CR>',
  "<silent>",
  "Test: Debug nearest test"
)
nnoremap("<leader>ts", ':lua require("neotest").run.stop()<CR>', "<silent>", "Test: Stop nearest test")
nnoremap("<leader>ta", ':lua require("neotest").run.attach()<CR>', "<silent>", "Test: Attach nearest test")
