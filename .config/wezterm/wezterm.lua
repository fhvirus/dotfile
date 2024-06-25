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
config.font = wezterm.font_with_fallback({
	-- "Hack Nerd Font Mono",
  "JetBrains Mono",
	"Noto Sans CJK TC",
})
config.font_size = 14

-- https://github.com/wez/wezterm/issues/250#issuecomment-902603506
-- for fcitx* support
config.use_ime = true

config.keys = {
	{
		key = "F11",
		-- mods = 'SHIFT|CTRL',
		action = wezterm.action.ToggleFullScreen,
	},
}

-- for zen-mode.nvim
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
