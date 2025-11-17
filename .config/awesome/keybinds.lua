local awful = require("awful")
local modkey = require("user_config").modkey
local shell = awful.spawn.with_shell

return {
	{
		modifier = { modkey },
		key = "Escape",
		command = "rofi_powermenu",
		description = "Power menu",
		group = "launcher",
	},
	{
		modifier = { modkey },
		key = "d",
		bind = function() shell("rofi_launcher") end,
		description = "app launcher",
		group = "launcher",
	},
	{
		modifier = { modkey },
		key = "l",
		command = "librewolf",
		description = "Librewolf",
		group = "launcher",
	},
	{
		modifier = { modkey },
		key = "e",
		command = "thunar",
		description = "Thunar",
		group = "launcher",
	},
	{
		modifier = {},
		key = "Print",
		bind = function() shell("dmenu_screenshot") end,
		description = "Screenshot",
		group = "launcher",
	},
	{
		modifier = { "Shift" },
		key = "Print",
		bind = function() shell("flameshot screen -c") end,
		description = "Screenshot active screen",
		group = "launcher",
	},
	{
		modifier = { "Control", "Mod1" },
		key = "Delete",
		bind = function() shell(IN_TERM("btop")) end,
		description = "btop",
		group = "launcher",
	},
}
