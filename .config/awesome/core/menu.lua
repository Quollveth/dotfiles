local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful")
local menubar = require("menubar")
---
local config = require("user_config")
local custom_items = require("menu_items")
local editor_cmd = IN_TERM(config.editor)
---

local awesome_menu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", IN_TERM("man awesome") },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	--[[
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
	]]
}

local menu_items = {}
menu_items[1] = { "Awesome", awesome_menu, beautiful.awesome_icon }

for k, v in pairs(custom_items) do
	if type(k) == "number" then
		menu_items[k + 1] = v
	elseif type(k) == "string" then
		table.insert(menu_items, { k, v })
	end
end

local main_menu = awful.menu({ items = menu_items })

local launcher = awful.widget.launcher({
	image = beautiful.awesome_icon,
	menu = mymainmenu,
})

-- Set the terminal for applications that require it
menubar.utils.terminal = config.terminal


return {
	menu = main_menu,
	launcher = launcher,
}
