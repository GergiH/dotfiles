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

--config.enable_tab_bar = false
config.tab_bar_at_bottom = true

-- For example, changing the color scheme:
config.color_scheme = 'Kanagawa (Gogh)'

config.default_prog = { 'powershell.exe' }

-- Mimic tmux keybindings
config.leader = { key="b", mods="CTRL" }
config.keys = {
    { key = "b",          mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
    { key = "-",          mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "%",          mods = "LEADER|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "s",          mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "v",          mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    { key = "o",          mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "z",          mods = "LEADER",       action="TogglePaneZoomState" },
    { key = "c",          mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    { key = "h",          mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "j",          mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "k",          mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "l",          mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "LeftArrow",  mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "DownArrow",  mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
    { key = "UpArrow",    mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "RightArrow", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "H",          mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
    { key = "J",          mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
    { key = "K",          mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
    { key = "L",          mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
    { key = "1",          mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
    { key = "2",          mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
    { key = "3",          mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
    { key = "4",          mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
    { key = "5",          mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
    { key = "6",          mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
    { key = "7",          mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
    { key = "8",          mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
    { key = "9",          mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
    { key = "&",          mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    { key = "d",          mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = "x",          mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
}

-- and finally, return the configuration to wezterm
return config
