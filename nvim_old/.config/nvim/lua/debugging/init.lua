local g = vim.g
local wk = require('which-key')

wk.register({
	d = {
		name = 'Debugging',

		-- Navigation
		a = { ':lua require("debugging.javascript").attach()<CR>', 'Attach' },
		c = { ':lua require("dap").continue()<CR>',	'Continue' },
		v = { ':lua require("dap").step_over()<CR>', 'Step over' },
		i = { ':lua require("dap").step_inside()<CR>', 'Step inside' },
		o = { ':lua require("dap").step_out()<CR>', 'Step out' },
		s = { ':lua require("dap").stop()<CR>', 'Stop' },

		-- Breakpoints
		b = { ':lua require("dap").toggle_breakpoint()<CR>', 'Toggle' },
		B = { ':lua require("dap").set_breakpoint(vim.fn.input("Condition: "))<CR>', 'Condition' },
		m = { ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log message: "))<CR>', 'Message' },

		-- UI
		r = {
			ame = 'REPL',
			o = { ':lua require("dap").repl.open()<CR>', 'Open' },
			l = { ':lua require("dap").repl.last()<CR>', 'Last' },
		},


		-- Finder
		f = {
			name = 'Find',
			m = { ':lua require("telescope").extensions.dap.commands()<CR>', 'Commands' },
			c = { ':lua require("telescope").extensions.dap.configurations()<CR>', 'Configurations' },
			b = { ':lua require("telescope").extensions.dap.list_breakpoints()<CR>', 'Breakpoints' },
			v = { ':lua require("telescope").extensions.dap.variables()<CR>', 'Variables' },
			f = { ':lua require("telescope").extensions.dap.frames()<CR>', 'Frames' },
		}
	}
}, { prefix = '<leader>' })

local M = {}

M.bootstrap = function()
	local dapinstall = require('dap-install')
	local debuggers = require('dap-install.core.debuggers_list').debuggers
	local fn = vim.fn

	for debugger, _ in pairs(debuggers) do
		local config = {}

		if debugger == 'jsnode_dbg' then
			require('debugging.javascript').extend_config(config)
		end

		dapinstall.config(debugger, config)
	end

    require('nvim-dap-virtual-text').setup()

	fn.sign_define('DapBreakpoint', {text='🔸', texthl='', linehl='', numhl=''})
	fn.sign_define('DapBreakpointRejected', {text='🔹', texthl='', linehl='', numhl=''})
	fn.sign_define('DapStopped', {text='🡆', texthl='', linehl='', numhl=''})
end

return M
