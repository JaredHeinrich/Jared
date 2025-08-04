local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Palenight (Gogh)"

config.window_decorations = "RESIZE"

config.font = wezterm.font({
    family = "JetBrainsMono Nerd Font Mono",
    weight = 'Bold',
})
config.font_size = 15
config.enable_tab_bar = false

return config
