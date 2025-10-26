local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "nord"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Noto Sans CJK TC",
})
config.font_size = 17

-- https://github.com/wez/wezterm/issues/250#issuecomment-902603506
-- for fcitx* support
config.use_ime = true

config.keys = {
  {
    key = "F11",
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
