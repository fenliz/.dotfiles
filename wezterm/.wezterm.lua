local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- Theme
config.color_scheme = "Catppuccin Mocha"

-- Keybindings
config.disable_default_key_bindings = true

-- Font
config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font_size = 12

return config
