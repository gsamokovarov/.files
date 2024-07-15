local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.use_fancy_tab_bar = false

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16

config.color_scheme = 'Gruvbox (Gogh)'
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }

config.keys = {
  { key = ']', mods = 'CMD', action = wezterm.action.RotatePanes 'Clockwise' },
  { key = '[', mods = 'CMD', action = wezterm.action.RotatePanes 'CounterClockwise' },
  { key = 'd', mods = 'CMD', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
  { key = 'd', mods = 'CMD|SHIFT', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
  { key = 'LeftArrow', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Left' } },
  { key = 'RightArrow', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Right' } },
  { key = 'UpArrow', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Up' } },
  { key = 'DownArrow', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Down' } },
}

return config
