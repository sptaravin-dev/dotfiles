-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is only for WSL
-- config.default_domain = "WSL:Ubuntu-22.04"
config.automatically_reload_config = true
-- config.color_scheme = "Nord (Gogh)"
config.color_scheme = "Kanagawa (Gogh)"

-- or, changing the font size and color scheme.
config.font = wezterm.font("FiraCode Nerd Font Mono Med")
config.font_size = 14

config.background = {
	{
		source = {
			File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/img/mountains_peaks_fog.jpg",
		},
		hsb = {
			hue = 1.0,
			saturation = 1.02,
			brightness = 0.25,
		},
		-- attachment = { Parallax = 0.3 },
		-- width = "100%",
		-- height = "100%",
	},
	{
		source = {
			Color = "#282c35",
		},
		width = "100%",
		height = "100%",
		-- opacity = 0.55,
		opacity = 0.75,
		-- opacity = 1,
	},
}

-- disable tab bar
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.native_macos_fullscreen_mode = true

-- Finally, return the configuration to wezterm:
return config
