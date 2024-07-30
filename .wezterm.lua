-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choicesdawn
config.window_frame = {
    font = wezterm.font { family = "Inter" }
}

config.window_background_image = '<path to bg image>'
config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

-- If background image is not used, just use this insted
--config.window_background_opacity = 0.85

config.initial_rows = 33
config.initial_cols = 125

config.font = wezterm.font('Noto Sans Mono', { weight = 'Medium' })
config.font_size = 11.0

config.enable_tab_bar = false

-- For example, changing the color scheme:
config.color_scheme = 'Harper'

config.default_prog = { 'powershell.exe' }

-- and finally, return the configuration to wezterm
return config
