local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16
config.color_scheme = 'Gruvbox (Gogh)'
config.keys = {
  { key = 'd', mods = 'CMD', action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
  { key = 'd', mods = 'CMD|SHIFT', action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } } },
  { key = 'h', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Left' } },
  { key = 'l', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Right' } },
  { key = 'k', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Up' } },
  { key = 'j', mods = 'CMD', action = wezterm.action { ActivatePaneDirection = 'Down' } },
  { key = 'LeftArrow', mods = 'CMD', action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
  { key = 'RightArrow', mods = 'CMD', action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
  { key = 'UpArrow', mods = 'CMD', action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
  { key = 'DownArrow', mods = 'CMD', action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
}

return config
