local telescope_actions_state = require("telescope.actions.state")

local M = {}

M.get_package_json_paths = function()
	local result = {}
	local paths = vim.fn.glob("**/package.json", true, true)
	for _, path in ipairs(paths) do
		if not string.match(path, "node_modules") then
			table.insert(result, path)
		end
	end
	return result
end

M.get_json_content = function(path)
	local content = vim.fn.readfile(path)
	if content == nil then
		return nil
	end
	return vim.fn.json_decode(content)
end

M.get_selected_npm_script = function(prompt_bufnr)
	local entry = telescope_actions_state.get_selected_entry(prompt_bufnr)
	return entry.value
end

M.get_npm_scripts = function()
	local npm_scripts = {}

	local package_jsons = M.get_package_json_paths()
	for _, path in ipairs(package_jsons) do
		local package_json = M.get_json_content(path)
		if package_json then
			local scripts = package_json.scripts
			if scripts then
				for name, content in pairs(scripts) do
					table.insert(npm_scripts, {
						name = name,
						content = content,
						package = package_json.name,
						path = path,
					})
				end
			end
		end
	end

	return npm_scripts
end

return M
