local packer_install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

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
		autocmd BufWritePost plugins.lua :lua ReloadPlugins()
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

	-- Common libraries
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- File icons & colors
	use("kyazdani42/nvim-web-devicons")

	-- UI Tweaks
	use("stevearc/dressing.nvim")

	-- Notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
			require("notify").setup({
				render = "minimal",
				timeout = 1000,
			})
		end,
	})

	-- Key mappings
	use({
		"b0o/mapx.nvim",
		requires = { "folke/which-key.nvim", "mrjones2014/legendary.nvim" },
		config = function()
			require("legendary").setup()
			require("mapx").setup({
				global = "force",
				whichkey = true,
			})
			require("user.mappings")
		end,
	})

	-- Easy split navigation between NVIM and TMUX
	use("christoomey/vim-tmux-navigator")

	-- Modules
	require("user.code-completion.plugins")(use)
	require("user.debugger.plugins")(use)
	require("user.editor.plugins")(use)
	require("user.file-explorer.plugins")(use)
	require("user.fuzzy-finder.plugins")(use)
	require("user.language-servers.plugins")(use)
	require("user.statusline.plugins")(use)
	require("user.syntax-parser.plugins")(use)
	require("user.tabline.plugins")(use)
	require("user.theme.plugins")(use)
	require("user.version-control.plugins")(use)

	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
