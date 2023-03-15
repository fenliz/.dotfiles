return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	opts = {
		integrations = {
			lightspeed = true,
			which_key = true,
			lsp_trouble = true,
		},
	},
	config = function()
		vim.cmd([[colorscheme catppuccin]])

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, {
				texthl = sign.name,
				text = sign.text,
				numhl = "",
			})
		end

		vim.diagnostic.config({
			signs = { active = signs },
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
