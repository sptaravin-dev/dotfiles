-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- or, changing the font size and color scheme.
config.font = wezterm.font("FiraMono Nerd Font Mono")
config.font_size = 10

-- Finally, return the configuration to wezterm:
return config
