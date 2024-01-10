-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "nord"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.font = wezterm.font_with_fallback {
  'Hack Nerd Font Mono',
  'Noto Sans CJK TC'
}

-- https://github.com/wez/wezterm/issues/250#issuecomment-902603506
-- for fcitx* support
config.use_ime = true

config.keys = {
  {
    key = 'F11',
    -- mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

-- and finally, return the configuration to wezterm
return config
