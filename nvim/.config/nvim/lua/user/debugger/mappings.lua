local mapx = require("mapx")

mapx.nname("<leader>d", "Debug")
mapx.nname("<leader>df", "Debug: Find")

-- Navigation
nnoremap("<leader>dc", '<cmd>lua require"dap".continue()<CR>', "<silent>", "Debug: Continue")
nnoremap("<leader>do", '<cmd>lua require"dap".step_over()<CR>', "<silent>", "Debug: Step over")
nnoremap("<leader>di", '<cmd>lua require"dap".step_inside()<CR>', "<silent>", "Debug: Step inside")
nnoremap("<leader>dO", '<cmd>lua require"dap".step_out()<CR>', "<silent>", "Debug: Step out")
nnoremap("<leader>dq", '<cmd>lua require"dap".close()<CR>', "<silent>", "Debug: Stop")

-- Breakpoints
nnoremap("<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>', "<silent>", "Debug: Toggle breakpoint")
nnoremap(
	"<leader>dB",
	'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>',
	"<silent>",
	"Debug: Set conditional breakpoint"
)
nnoremap(
	"<leader>dl",
	'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Message: "))<CR>',
	"<silent>",
	"Debug: Set logpoint"
)

-- Fuzzy finder
nnoremap("<leader>dfm", '<cmd>lua require"telescope".extensions.dap.commands()<CR>', "<silent>", "Debug: Find command")
nnoremap(
	"<leader>dfc",
	'<cmd>lua require"telescope".extensions.dap.configuration()<CR>',
	"<silent>",
	"Debug: Find configuration"
)
nnoremap(
	"<leader>dfb",
	'<cmd>lua require"telescope".extensions.dap.list_breakpoints()<CR>',
	"<silent>",
	"Debug: Find breakpoints"
)
nnoremap(
	"<leader>dfv",
	'<cmd>lua require"telescope".extensions.dap.variables()<CR>',
	"<silent>",
	"Debug: Find variables"
)
nnoremap("<leader>dff", '<cmd>lua require"telescope".extensions.dap.frames()<CR>', "<silent>", "Debug: Find frames")
