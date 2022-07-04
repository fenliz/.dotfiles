local telescope_actions = require("telescope.actions")
local toggleterm = require("toggleterm")

local utils = require("user.fuzzy-finder.npm-scripts.utils")

local get_cmd = function(script_name)
	return "npm run " .. script_name
end

local M = {}

M.run_selected_script = function(prompt_bufnr)
	telescope_actions.close(prompt_bufnr)
	local npm_script = utils.get_selected_npm_script(prompt_bufnr)
	toggleterm.exec_command("cmd='" .. get_cmd(npm_script.name) .. "'")
end

return M
