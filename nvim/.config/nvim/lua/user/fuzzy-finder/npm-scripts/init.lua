local telescope_pickers = require("telescope.pickers")
local telescope_config = require("telescope.config").values
local telescope_actions = require("telescope.actions")

local utils = require("user.fuzzy-finder.npm-scripts.utils")
local finders = require("user.fuzzy-finder.npm-scripts.finders")
local actions = require("user.fuzzy-finder.npm-scripts.actions")

local M = {}

M.npm_script = function(opts)
	opts = opts or {}

	telescope_pickers.new(opts, {
		prompt_title = opts.prompt_title or "Pick a script",
		results_title = opts.results_title or "NPM scripts",
		finder = finders.npm_script_finder(opts, utils.get_npm_scripts()),
		sorter = telescope_config.file_sorter(opts),
		attach_mappings = function(prompt_bufnr)
			telescope_actions.select_default:replace(function()
				actions.run_selected_script(prompt_bufnr)
			end)
			return true
		end,
	}):find()
end

return M
