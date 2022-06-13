local mapx = require("mapx")

mapx.nname("<leader>t", "Test")

nnoremap("<leader>tt", ':lua require("neotest").run.run()', "<silent>", "Test: Nearest test")
nnoremap("<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))', "<silent>", "Test: Current file")

nnoremap("<leader>td", ':lua require("neotest").run.run({ strategy = "dap" })', "<silent>", "Test: Debug nearest test")
nnoremap("<leader>ts", ':lua require("neotest").run.stop()', "<silent>", "Test: Stop nearest test")
nnoremap("<leader>ta", ':lua require("neotest").run.attach()', "<silent>", "Test: Attach nearest test")
