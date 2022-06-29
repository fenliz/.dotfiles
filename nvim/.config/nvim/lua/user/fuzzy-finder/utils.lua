local M = {}

M.find_dotfiles = function(opts)
	opts.prompt_title = "<Dotfiles>"
	opts.cwd = vim.env.DOTFILES
	opts.hidden = true

	require("telescope.builtin").find_files(opts)
end

M.find_files = function(opts)
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

M.search_for_text = function(opts)
	opts.vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--trim",
	}
	if vim.fn.getcwd() == vim.env.DOTFILES then
		table.insert(opts.vimgrep_arguments, "--hidden")
	end
	require("telescope.builtin").grep_string(opts)
end

return M
