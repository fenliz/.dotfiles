local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

return function(plugins)
	-- Automatically install packer
	if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
		print("Installing packer...")
		PACKER_BOOTSTRAP = vim.fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			packer_install_path,
		})
		vim.cmd([[packadd packer.nvim]])
	end

	local status_ok, packer = pcall(require, "packer")
	if not status_ok then
		return
	end

	function _G.ReloadConfig()
		-- Remove all cached lua "user" modules
		for name, _ in pairs(package.loaded) do
			if name:match("^user") then
				package.loaded[name] = nil
			end
		end

		dofile(vim.env.MYVIMRC)
	end

	function _G.ReloadPlugins()
		_G.ReloadConfig()
		require("packer").sync()
	end

	-- Automatically reload neovim whenever the plugin file has been modified
	vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost *.lua :lua ReloadPlugins()
	augroup end
]])

	packer.init()

	return packer.startup(function(use)
		-- Speed up startup time
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient")
			end,
		})

		-- Package manager
		use("wbthomason/packer.nvim")

		plugins(use)

		if PACKER_BOOTSTRAP then
			packer.sync()
		end
	end)
end
