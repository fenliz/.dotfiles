local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- Window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- Theme
config.color_scheme = "Catppuccin Mocha"

-- Keybindings
config.disable_default_key_bindings = true
config.keys = {
	-- Paste from clipboard
	{ key = "v", mods = "CMD", action = action.PasteFrom("Clipboard") },
}

-- Font
config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font_size = 12

-- Performance
config.max_fps = 120

return config
