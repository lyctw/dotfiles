local wezterm = require("wezterm")
local config = {}

-- config.color_scheme = "Aci (Gogh)"
-- config.color_scheme = "Afterglow"
config.color_scheme = "Adventure"

-- Install FiraCode: yay -S ttf-fira-code
config.font = wezterm.font("FiraCode-Regular")
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.75

return config
