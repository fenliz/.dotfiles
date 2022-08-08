local M = {}

M.mappings = function()
	require("user.modules.code-completion").mappings()
	require("user.modules.file-explorer").mappings()
	require("user.modules.fuzzy-finder").mappings()
	require("user.modules.language-servers").mappings()
	require("user.modules.task-runner").mappings()
	require("user.modules.terminal").mappings()
	require("user.modules.test-runner").mappings()
	require("user.modules.text-editor").mappings()
	require("user.modules.version-control").mappings()

	local opts = { noremap = true, silent = true }

	vim.keymap.set("n", "<F10>", function()
		if vim.o.conceallevel > 0 then
			vim.o.conceallevel = 0
		else
			vim.o.conceallevel = 2
		end
	end, opts)

	vim.keymap.set("n", "<F11>", function()
		if vim.o.concealcursor == "n" then
			vim.o.concealcursor = ""
		else
			vim.o.concealcursor = "n"
		end
	end, opts)
end

M.setup = function()
	vim.g.mapleader = " "
	require("user.modules.code-completion").options()
	require("user.modules.statusline").options()
	require("user.modules.text-editor").options()

	require("user.packer")(function(use)
		require("user.modules.code-completion").plugins(use)
		require("user.modules.file-explorer").plugins(use)
		require("user.modules.fuzzy-finder").plugins(use)
		require("user.modules.http-client").plugins(use)
		require("user.modules.keymappings").plugins(use)
		require("user.modules.language-servers").plugins(use)
		require("user.modules.navigation").plugins(use)
		require("user.modules.notifications").plugins(use)
		require("user.modules.statusline").plugins(use)
		require("user.modules.task-runner").plugins(use)
		require("user.modules.terminal").plugins(use)
		require("user.modules.test-runner").plugins(use)
		require("user.modules.text-editor").plugins(use)
		require("user.modules.treesitter").plugins(use)
		require("user.modules.version-control").plugins(use)
		require("user.modules.visuals").plugins(use)
	end)
end

return M
