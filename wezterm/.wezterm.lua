local wezterm = require("wezterm")
local c = {}
if wezterm.config_builder then
	c = wezterm.config_builder()
end

-- 初始大小
c.initial_cols = 120
c.initial_rows = 31

-- 关闭时不进行确认
c.window_close_confirmation = "NeverPrompt"

-- 设置默认终端以及 开始路径
c.default_prog = { "wsl", "--distribution", "Arch", "--cd", "/home/fergus" }

-- 配置颜色主题
c.color_scheme = "Catppuccin Frappe"

c.font = wezterm.font("Maple Mono NF CN", { weight = "Light", stretch = "Normal", style = "Italic" })

-- 如果只有一个tab就隐藏tab_bar
c.hide_tab_bar_if_only_one_tab = true

-- 取消windows原生标题栏
c.window_decorations = "RESIZE"

-- 启用滚动条
c.enable_scroll_bar = true

-- 边距
c.window_padding = {
	left = "2cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.5cell",
}

-- 设置背景透明度
c.window_background_opacity = 0.85
-- 设置高斯模糊
c.win32_system_backdrop = "Acrylic"

-- 未激活的pane颜色
c.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.2,
}

-- 屏蔽所有默认快捷键
c.disable_default_key_bindings = true

local act = wezterm.action

c.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 3000 }

c.keys = {
	-- Ctrl+Shift+Tab 遍历 tab
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(1) },
	-- F11 切换全屏
	{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
	-- Ctrl + + 字体增大
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	-- Ctrl + - 字体减小
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	-- Ctrl + 0 字体复位
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	-- Ctrl+Shift+C 复制选中区域
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	-- Ctrl+Shift+C 复制选中区域
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	-- Ctrl+Shift+N 新窗口
	{ key = "N", mods = "CTRL", action = act.SpawnWindow },
	-- Ctrl+Shift+T 新 tab
	{ key = "T", mods = "CTRL", action = act.ShowLauncher },
	-- Ctrl+Shift+Enter 显示启动菜单
	{ key = "Enter", mods = "SHIFT|CTRL", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS|LAUNCH_MENU_ITEMS" }) },
	{ key = " ", mods = "SHIFT|CTRL", action = act.QuickSelect },
	-- tmux类似的多路复用快捷键
	-- 还是使用zellij代替,更强大
	{ key = "%", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "s", mods = "LEADER", action = act.PaneSelect({ mode = "SwapWithActive" }) },
	{ key = "E", mods = "LEADER", action = act.EmitEvent("trigger-vim-with-scrollback") },
}

return c
