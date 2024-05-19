local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end
config.color_scheme = "github_dark_default"
config.window_padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}
-- config.disable_default_key_bindings = true
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	tab_bar = {
		background = "#0d1117",
		active_tab = {
			bg_color = "#0d1117",
			fg_color = "#e6edf3",
			italic = true,
		},
		inactive_tab = {
			bg_color = "#0d1117",
			fg_color = "#e6edf3",
		},
		new_tab = {
			bg_color = "#0d1117",
			fg_color = "#e6edf3",
		},
	},
}

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "/", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "'", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "w", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
        key = ";",
	mods = "CTRL",
        action = wezterm.action_callback(function(_, pane)
            local tab = pane:tab()
            local panes = tab:panes_with_info()
            if #panes == 1 then
                pane:split({
                    direction = "Bottom",
                    size = 0.4,
                })
            elseif not panes[1].is_zoomed then
                panes[1].pane:activate()
                tab:set_zoomed(true)
            elseif panes[1].is_zoomed then
                tab:set_zoomed(false)
                panes[2].pane:activate()
            end
        end),
	},
}

config.color_schemes = {
	["github_dark_default"] = {
		background = "#0d1117",
		foreground = "#e6edf3",

		cursor_bg = "#e6edf3",
		cursor_border = "#e6edf3",
		cursor_fg = "#0d1117",

		selection_bg = "#1e4273",
		selection_fg = "#e6edf3",

		ansi = {
			"#484f58",
			"#ff7b72",
			"#3fb950",
			"#d29922",
			"#58a6ff",
			"#bc8cff",
			"#39c5cf",
			"#b1bac4",
		},
		brights = {
			"#6e7681",
			"#ffa198",
			"#56d364",
			"#e3b341",
			"#79c0ff",
			"#d2a8ff",
			"#56d4dd",
			"#ffffff",
		},
	},
}
return config
